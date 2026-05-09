; DESCRIPTION: Places a orange line segment connecting (64, 88) to (270, 198).
; PLAN: r0=64(x1), r1=88(y1), r2=270(x2), r3=198(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 88
LDI r2, 270
LDI r3, 198
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
