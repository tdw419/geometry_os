; DESCRIPTION: Places a yellow line segment connecting (239, 216) to (88, 72).
; PLAN: r0=239(x1), r1=216(y1), r2=88(x2), r3=72(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 216
LDI r2, 88
LDI r3, 72
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
