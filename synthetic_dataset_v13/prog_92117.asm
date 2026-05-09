; DESCRIPTION: Places a yellow line segment connecting (438, 217) to (284, 105).
; PLAN: r0=438(x1), r1=217(y1), r2=284(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 217
LDI r2, 284
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
