; DESCRIPTION: Composite: Sets a single green pixel at (134, 151) then Places a yellow circle of radius 37 at center (271, 67) then Draws a purple rectangle at (65, 43) with width 105 and height 33.
; PLAN: r0=134(x), r1=151(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=271(x), r6=67(y), r7=37(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=65(x), r11=43(y), r12=105(width), r13=33(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 134
LDI r1, 151
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 271
LDI r6, 67
LDI r7, 37
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 65
LDI r11, 43
LDI r12, 105
LDI r13, 33
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
