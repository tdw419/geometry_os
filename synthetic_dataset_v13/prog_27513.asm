; DESCRIPTION: Places a blue line segment connecting (110, 19) to (407, 43).
; PLAN: r0=110(x1), r1=19(y1), r2=407(x2), r3=43(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 19
LDI r2, 407
LDI r3, 43
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
