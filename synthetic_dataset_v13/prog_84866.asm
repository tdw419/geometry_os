; DESCRIPTION: Composite: Draws a white rectangle at (14, 7) with width 74 and height 100 then Creates a red circular shape at (240, 158) with radius 77 then Places a black dot at position (19, 73).
; PLAN: r0=14(x), r1=7(y), r2=74(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=240(x), r6=158(y), r7=77(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=19(x), r11=73(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 14
LDI r1, 7
LDI r2, 74
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 158
LDI r7, 77
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 19
LDI r11, 73
LDI r12, 0x000000
PSET r10, r11, r12
HALT
