; DESCRIPTION: Draws a yellow line from (318, 101) to (371, 88).
; PLAN: r0=318(x1), r1=101(y1), r2=371(x2), r3=88(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 101
LDI r2, 371
LDI r3, 88
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
