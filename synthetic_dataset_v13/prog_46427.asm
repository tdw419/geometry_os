; DESCRIPTION: Composite: Creates a magenta rectangular region at (77, 3) spanning 62 by 88 pixels then Places a yellow dot at position (402, 178) then Draws a blue line from (13, 26) to (324, 95).
; PLAN: r0=77(x), r1=3(y), r2=62(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=402(x), r6=178(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=13(x1), r11=26(y1), r12=324(x2), r13=95(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 77
LDI r1, 3
LDI r2, 62
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 178
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 13
LDI r11, 26
LDI r12, 324
LDI r13, 95
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
