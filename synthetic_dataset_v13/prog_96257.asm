; DESCRIPTION: Places a yellow line segment connecting (49, 80) to (375, 191).
; PLAN: r0=49(x1), r1=80(y1), r2=375(x2), r3=191(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 80
LDI r2, 375
LDI r3, 191
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
