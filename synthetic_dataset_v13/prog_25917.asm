; DESCRIPTION: Places a yellow line segment connecting (334, 12) to (248, 9).
; PLAN: r0=334(x1), r1=12(y1), r2=248(x2), r3=9(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 12
LDI r2, 248
LDI r3, 9
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
