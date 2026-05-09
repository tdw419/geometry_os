; DESCRIPTION: Places a blue line segment connecting (453, 152) to (417, 35).
; PLAN: r0=453(x1), r1=152(y1), r2=417(x2), r3=35(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 152
LDI r2, 417
LDI r3, 35
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
