; DESCRIPTION: Places a yellow line segment connecting (15, 178) to (60, 158).
; PLAN: r0=15(x1), r1=178(y1), r2=60(x2), r3=158(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 178
LDI r2, 60
LDI r3, 158
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
