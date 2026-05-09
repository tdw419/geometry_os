; DESCRIPTION: Places a green line segment connecting (325, 94) to (290, 78).
; PLAN: r0=325(x1), r1=94(y1), r2=290(x2), r3=78(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 94
LDI r2, 290
LDI r3, 78
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
