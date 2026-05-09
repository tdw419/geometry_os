; DESCRIPTION: Draws a orange line from (258, 88) to (421, 179).
; PLAN: r0=258(x1), r1=88(y1), r2=421(x2), r3=179(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 88
LDI r2, 421
LDI r3, 179
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
