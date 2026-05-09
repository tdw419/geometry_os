; DESCRIPTION: Places a yellow line segment connecting (37, 78) to (251, 214).
; PLAN: r0=37(x1), r1=78(y1), r2=251(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 78
LDI r2, 251
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
