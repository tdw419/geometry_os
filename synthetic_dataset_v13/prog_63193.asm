; DESCRIPTION: Composite: Draws a magenta circle centered at (147, 68) with radius 56 then Sets a single purple pixel at (120, 188) then Creates a green rectangular region at (316, 155) spanning 120 by 39 pixels.
; PLAN: r0=147(x), r1=68(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=120(x), r6=188(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=316(x), r11=155(y), r12=120(width), r13=39(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 147
LDI r1, 68
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 120
LDI r6, 188
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 316
LDI r11, 155
LDI r12, 120
LDI r13, 39
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
