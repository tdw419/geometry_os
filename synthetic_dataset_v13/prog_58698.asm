; DESCRIPTION: Places a yellow line segment connecting (109, 76) to (232, 223).
; PLAN: r0=109(x1), r1=76(y1), r2=232(x2), r3=223(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 76
LDI r2, 232
LDI r3, 223
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
