; DESCRIPTION: Places a black line segment connecting (86, 56) to (357, 208).
; PLAN: r0=86(x1), r1=56(y1), r2=357(x2), r3=208(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 56
LDI r2, 357
LDI r3, 208
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
