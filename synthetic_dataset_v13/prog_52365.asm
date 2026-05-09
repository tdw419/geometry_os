; DESCRIPTION: Composite: Draws a black rectangle at (334, 78) with width 14 and height 105 then Creates a blue circular shape at (170, 95) with radius 72 then Places a cyan dot at position (239, 141).
; PLAN: r0=334(x), r1=78(y), r2=14(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=170(x), r6=95(y), r7=72(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=239(x), r11=141(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 334
LDI r1, 78
LDI r2, 14
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 95
LDI r7, 72
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 239
LDI r11, 141
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
