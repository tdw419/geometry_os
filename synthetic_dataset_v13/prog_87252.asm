; DESCRIPTION: Places a yellow line segment connecting (154, 9) to (216, 252).
; PLAN: r0=154(x1), r1=9(y1), r2=216(x2), r3=252(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 9
LDI r2, 216
LDI r3, 252
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
