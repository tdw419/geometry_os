; DESCRIPTION: Composite: Sets a single cyan pixel at (85, 24) then Places a white circle of radius 49 at center (347, 76) then Draws a red rectangle at (205, 142) with width 102 and height 92.
; PLAN: r0=85(x), r1=24(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=347(x), r6=76(y), r7=49(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=205(x), r11=142(y), r12=102(width), r13=92(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 85
LDI r1, 24
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 347
LDI r6, 76
LDI r7, 49
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 205
LDI r11, 142
LDI r12, 102
LDI r13, 92
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
