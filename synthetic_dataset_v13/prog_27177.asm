; DESCRIPTION: Composite: Draws a blue circle centered at (380, 174) with radius 45 then Sets a single white pixel at (84, 19) then Creates a magenta rectangular region at (373, 88) spanning 22 by 94 pixels.
; PLAN: r0=380(x), r1=174(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=84(x), r6=19(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=373(x), r11=88(y), r12=22(width), r13=94(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 380
LDI r1, 174
LDI r2, 45
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 84
LDI r6, 19
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 373
LDI r11, 88
LDI r12, 22
LDI r13, 94
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
