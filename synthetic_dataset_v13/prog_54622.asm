; DESCRIPTION: Places a yellow line segment connecting (440, 7) to (438, 105).
; PLAN: r0=440(x1), r1=7(y1), r2=438(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 7
LDI r2, 438
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
