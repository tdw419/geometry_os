; DESCRIPTION: Places a yellow line segment connecting (411, 9) to (396, 191).
; PLAN: r0=411(x1), r1=9(y1), r2=396(x2), r3=191(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 9
LDI r2, 396
LDI r3, 191
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
