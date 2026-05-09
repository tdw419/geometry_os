; DESCRIPTION: Places a yellow line segment connecting (151, 88) to (38, 121).
; PLAN: r0=151(x1), r1=88(y1), r2=38(x2), r3=121(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 88
LDI r2, 38
LDI r3, 121
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
