; DESCRIPTION: Draws a purple line from (100, 105) to (407, 193).
; PLAN: r0=100(x1), r1=105(y1), r2=407(x2), r3=193(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 105
LDI r2, 407
LDI r3, 193
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
