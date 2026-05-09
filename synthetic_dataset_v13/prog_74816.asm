; DESCRIPTION: Renders a purple line between points (288, 9) and (38, 176).
; PLAN: r0=288(x1), r1=9(y1), r2=38(x2), r3=176(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 9
LDI r2, 38
LDI r3, 176
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
