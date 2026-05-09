; DESCRIPTION: Composite: Draws a orange circle centered at (204, 91) with radius 18 then Sets a single yellow pixel at (223, 240) then Creates a orange rectangular region at (144, 130) spanning 106 by 67 pixels.
; PLAN: r0=204(x), r1=91(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=223(x), r6=240(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=144(x), r11=130(y), r12=106(width), r13=67(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 204
LDI r1, 91
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 223
LDI r6, 240
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 144
LDI r11, 130
LDI r12, 106
LDI r13, 67
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
