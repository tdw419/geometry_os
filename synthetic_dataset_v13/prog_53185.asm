; DESCRIPTION: Composite: Draws a purple circle centered at (216, 88) with radius 71 then Sets a single orange pixel at (38, 54) then Creates a green rectangular region at (291, 172) spanning 28 by 39 pixels.
; PLAN: r0=216(x), r1=88(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=38(x), r6=54(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=291(x), r11=172(y), r12=28(width), r13=39(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 216
LDI r1, 88
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 38
LDI r6, 54
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 291
LDI r11, 172
LDI r12, 28
LDI r13, 39
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
