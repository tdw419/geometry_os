; DESCRIPTION: Draws a purple line from (318, 115) to (78, 55).
; PLAN: r0=318(x1), r1=115(y1), r2=78(x2), r3=55(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 115
LDI r2, 78
LDI r3, 55
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
