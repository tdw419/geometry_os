; DESCRIPTION: Composite: Places a yellow circle of radius 44 at center (145, 115) then Draws a orange rectangle at (226, 144) with width 30 and height 68 then Draws a magenta line from (496, 239) to (15, 163).
; PLAN: r0=145(x), r1=115(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=226(x), r6=144(y), r7=30(width), r8=68(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=496(x1), r11=239(y1), r12=15(x2), r13=163(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 145
LDI r1, 115
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 226
LDI r6, 144
LDI r7, 30
LDI r8, 68
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 496
LDI r11, 239
LDI r12, 15
LDI r13, 163
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
