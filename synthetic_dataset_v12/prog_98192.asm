; DESCRIPTION: Places a yellow line segment connecting (248, 78) to (289, 15).
; PLAN: r0=248(x1), r1=78(y1), r2=289(x2), r3=15(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 78
LDI r2, 289
LDI r3, 15
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
