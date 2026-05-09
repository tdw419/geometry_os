; DESCRIPTION: Composite: Sets a single yellow pixel at (104, 238) then Creates a white circular shape at (108, 203) with radius 38 then Draws a magenta rectangle at (176, 105) with width 35 and height 99.
; PLAN: r0=104(x), r1=238(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=108(x), r6=203(y), r7=38(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=176(x), r11=105(y), r12=35(width), r13=99(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 104
LDI r1, 238
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 108
LDI r6, 203
LDI r7, 38
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 176
LDI r11, 105
LDI r12, 35
LDI r13, 99
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
