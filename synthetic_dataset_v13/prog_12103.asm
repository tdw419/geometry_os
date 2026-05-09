; DESCRIPTION: Places a blue line segment connecting (247, 191) to (229, 152).
; PLAN: r0=247(x1), r1=191(y1), r2=229(x2), r3=152(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 191
LDI r2, 229
LDI r3, 152
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
