; DESCRIPTION: Places a yellow line segment connecting (110, 101) to (215, 88).
; PLAN: r0=110(x1), r1=101(y1), r2=215(x2), r3=88(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 101
LDI r2, 215
LDI r3, 88
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
