; DESCRIPTION: Places a yellow line segment connecting (18, 85) to (189, 88).
; PLAN: r0=18(x1), r1=85(y1), r2=189(x2), r3=88(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 85
LDI r2, 189
LDI r3, 88
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
