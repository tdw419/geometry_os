; DESCRIPTION: Places a yellow line segment connecting (151, 178) to (375, 205).
; PLAN: r0=151(x1), r1=178(y1), r2=375(x2), r3=205(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 178
LDI r2, 375
LDI r3, 205
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
