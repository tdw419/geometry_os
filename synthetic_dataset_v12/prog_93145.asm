; DESCRIPTION: Composite: Sets a single blue pixel at (350, 239) then Draws a purple circle centered at (341, 51) with radius 28 then Creates a green rectangular region at (245, 149) spanning 84 by 37 pixels.
; PLAN: r0=350(x), r1=239(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=341(x), r6=51(y), r7=28(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=245(x), r11=149(y), r12=84(width), r13=37(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 350
LDI r1, 239
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 341
LDI r6, 51
LDI r7, 28
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 245
LDI r11, 149
LDI r12, 84
LDI r13, 37
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
