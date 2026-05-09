; DESCRIPTION: Places a yellow line segment connecting (441, 61) to (268, 110).
; PLAN: r0=441(x1), r1=61(y1), r2=268(x2), r3=110(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 61
LDI r2, 268
LDI r3, 110
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
