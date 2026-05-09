; DESCRIPTION: Places a yellow line segment connecting (461, 85) to (353, 198).
; PLAN: r0=461(x1), r1=85(y1), r2=353(x2), r3=198(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 85
LDI r2, 353
LDI r3, 198
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
