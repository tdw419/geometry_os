; DESCRIPTION: Composite: Sets a single black pixel at (485, 84) then Places a magenta circle of radius 60 at center (357, 134) then Creates a yellow rectangular region at (232, 72) spanning 79 by 60 pixels.
; PLAN: r0=485(x), r1=84(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=357(x), r6=134(y), r7=60(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=232(x), r11=72(y), r12=79(width), r13=60(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 485
LDI r1, 84
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 357
LDI r6, 134
LDI r7, 60
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 232
LDI r11, 72
LDI r12, 79
LDI r13, 60
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
