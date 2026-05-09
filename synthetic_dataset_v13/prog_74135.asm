; DESCRIPTION: Places a yellow line segment connecting (95, 114) to (96, 88).
; PLAN: r0=95(x1), r1=114(y1), r2=96(x2), r3=88(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 114
LDI r2, 96
LDI r3, 88
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
