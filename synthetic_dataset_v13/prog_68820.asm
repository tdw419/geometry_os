; DESCRIPTION: Draws a purple line from (161, 78) to (105, 152).
; PLAN: r0=161(x1), r1=78(y1), r2=105(x2), r3=152(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 78
LDI r2, 105
LDI r3, 152
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
