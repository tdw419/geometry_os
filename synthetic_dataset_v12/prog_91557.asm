; DESCRIPTION: Places a yellow line segment connecting (49, 19) to (254, 252).
; PLAN: r0=49(x1), r1=19(y1), r2=254(x2), r3=252(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 19
LDI r2, 254
LDI r3, 252
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
