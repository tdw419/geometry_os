; DESCRIPTION: Places a yellow line segment connecting (264, 156) to (227, 70).
; PLAN: r0=264(x1), r1=156(y1), r2=227(x2), r3=70(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 156
LDI r2, 227
LDI r3, 70
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
