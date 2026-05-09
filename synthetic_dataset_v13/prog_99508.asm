; DESCRIPTION: Places a yellow line segment connecting (326, 9) to (273, 251).
; PLAN: r0=326(x1), r1=9(y1), r2=273(x2), r3=251(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 9
LDI r2, 273
LDI r3, 251
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
