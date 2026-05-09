; DESCRIPTION: Places a yellow line segment connecting (176, 44) to (314, 26).
; PLAN: r0=176(x1), r1=44(y1), r2=314(x2), r3=26(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 44
LDI r2, 314
LDI r3, 26
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
