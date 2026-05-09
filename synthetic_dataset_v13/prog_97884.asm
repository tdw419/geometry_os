; DESCRIPTION: Composite: Draws a orange rectangle at (253, 107) with width 29 and height 37 then Sets a single white pixel at (358, 183) then Creates a magenta circular shape at (333, 75) with radius 63.
; PLAN: r0=253(x), r1=107(y), r2=29(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=358(x), r6=183(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=333(x), r11=75(y), r12=63(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 253
LDI r1, 107
LDI r2, 29
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 183
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 333
LDI r11, 75
LDI r12, 63
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
