; DESCRIPTION: Places a black line segment connecting (56, 184) to (388, 21).
; PLAN: r0=56(x1), r1=184(y1), r2=388(x2), r3=21(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 184
LDI r2, 388
LDI r3, 21
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
