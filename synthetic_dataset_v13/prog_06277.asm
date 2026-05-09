; DESCRIPTION: Renders a yellow line between points (478, 76) and (428, 212).
; PLAN: r0=478(x1), r1=76(y1), r2=428(x2), r3=212(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 76
LDI r2, 428
LDI r3, 212
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
