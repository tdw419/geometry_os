; DESCRIPTION: Places a blue line segment connecting (453, 201) to (110, 210).
; PLAN: r0=453(x1), r1=201(y1), r2=110(x2), r3=210(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 201
LDI r2, 110
LDI r3, 210
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
