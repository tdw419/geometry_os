; DESCRIPTION: Places a yellow line segment connecting (54, 78) to (108, 248).
; PLAN: r0=54(x1), r1=78(y1), r2=108(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 78
LDI r2, 108
LDI r3, 248
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
