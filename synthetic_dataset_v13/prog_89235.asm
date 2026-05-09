; DESCRIPTION: Places a black line segment connecting (430, 62) to (341, 229).
; PLAN: r0=430(x1), r1=62(y1), r2=341(x2), r3=229(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 62
LDI r2, 341
LDI r3, 229
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
