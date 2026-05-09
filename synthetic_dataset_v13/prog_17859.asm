; DESCRIPTION: Composite: Places a black 49x74 rectangle at position (251, 162) then Sets a single magenta pixel at (283, 183) then Draws a yellow line from (88, 188) to (20, 1).
; PLAN: r0=251(x), r1=162(y), r2=49(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=283(x), r6=183(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=88(x1), r11=188(y1), r12=20(x2), r13=1(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 251
LDI r1, 162
LDI r2, 49
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 283
LDI r6, 183
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 88
LDI r11, 188
LDI r12, 20
LDI r13, 1
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
