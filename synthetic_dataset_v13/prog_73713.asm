; DESCRIPTION: Places a orange line segment connecting (417, 53) to (188, 248).
; PLAN: r0=417(x1), r1=53(y1), r2=188(x2), r3=248(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 53
LDI r2, 188
LDI r3, 248
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
