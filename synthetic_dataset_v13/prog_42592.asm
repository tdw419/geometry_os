; DESCRIPTION: Renders a purple line between points (389, 239) and (194, 166).
; PLAN: r0=389(x1), r1=239(y1), r2=194(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 239
LDI r2, 194
LDI r3, 166
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
