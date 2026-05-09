; DESCRIPTION: Places a blue line segment connecting (289, 155) to (99, 192).
; PLAN: r0=289(x1), r1=155(y1), r2=99(x2), r3=192(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 155
LDI r2, 99
LDI r3, 192
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
