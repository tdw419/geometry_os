; DESCRIPTION: Places a yellow line segment connecting (131, 30) to (438, 138).
; PLAN: r0=131(x1), r1=30(y1), r2=438(x2), r3=138(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 30
LDI r2, 438
LDI r3, 138
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
