; DESCRIPTION: Places a blue line segment connecting (216, 174) to (356, 152).
; PLAN: r0=216(x1), r1=174(y1), r2=356(x2), r3=152(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 174
LDI r2, 356
LDI r3, 152
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
