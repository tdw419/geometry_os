; DESCRIPTION: Draws a yellow line from (181, 222) to (497, 81).
; PLAN: r0=181(x1), r1=222(y1), r2=497(x2), r3=81(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 222
LDI r2, 497
LDI r3, 81
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
