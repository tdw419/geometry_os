; DESCRIPTION: Places a black line segment connecting (388, 234) to (353, 8).
; PLAN: r0=388(x1), r1=234(y1), r2=353(x2), r3=8(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 234
LDI r2, 353
LDI r3, 8
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
