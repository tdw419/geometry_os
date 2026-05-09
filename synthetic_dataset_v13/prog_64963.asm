; DESCRIPTION: Places a yellow line segment connecting (14, 72) to (161, 85).
; PLAN: r0=14(x1), r1=72(y1), r2=161(x2), r3=85(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 72
LDI r2, 161
LDI r3, 85
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
