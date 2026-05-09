; DESCRIPTION: Places a black line segment connecting (414, 170) to (355, 143).
; PLAN: r0=414(x1), r1=170(y1), r2=355(x2), r3=143(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 170
LDI r2, 355
LDI r3, 143
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
