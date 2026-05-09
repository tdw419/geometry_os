; DESCRIPTION: Places a purple line segment connecting (205, 51) to (78, 152).
; PLAN: r0=205(x1), r1=51(y1), r2=78(x2), r3=152(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 51
LDI r2, 78
LDI r3, 152
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
