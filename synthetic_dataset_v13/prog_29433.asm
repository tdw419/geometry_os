; DESCRIPTION: Places a yellow line segment connecting (91, 244) to (314, 24).
; PLAN: r0=91(x1), r1=244(y1), r2=314(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 244
LDI r2, 314
LDI r3, 24
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
