; DESCRIPTION: Composite: Draws a magenta rectangle at (116, 167) with width 101 and height 67 then Sets a single white pixel at (18, 165) then Creates a yellow circular shape at (229, 217) with radius 20.
; PLAN: r0=116(x), r1=167(y), r2=101(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=18(x), r6=165(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=229(x), r11=217(y), r12=20(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 116
LDI r1, 167
LDI r2, 101
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 18
LDI r6, 165
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 229
LDI r11, 217
LDI r12, 20
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
