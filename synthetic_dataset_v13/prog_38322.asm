; DESCRIPTION: Composite: Draws a blue rectangle at (170, 182) with width 62 and height 24 then Creates a purple circular shape at (348, 108) with radius 42 then Places a white dot at position (141, 203).
; PLAN: r0=170(x), r1=182(y), r2=62(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=348(x), r6=108(y), r7=42(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=141(x), r11=203(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 170
LDI r1, 182
LDI r2, 62
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 108
LDI r7, 42
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 141
LDI r11, 203
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
