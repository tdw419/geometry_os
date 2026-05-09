; DESCRIPTION: Renders a purple line between points (281, 167) and (477, 239).
; PLAN: r0=281(x1), r1=167(y1), r2=477(x2), r3=239(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 167
LDI r2, 477
LDI r3, 239
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
