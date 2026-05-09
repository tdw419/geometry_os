; DESCRIPTION: Draws a yellow line from (134, 88) to (207, 254).
; PLAN: r0=134(x1), r1=88(y1), r2=207(x2), r3=254(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 88
LDI r2, 207
LDI r3, 254
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
