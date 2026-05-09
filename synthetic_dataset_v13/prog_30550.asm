; DESCRIPTION: Composite: Draws a purple circle centered at (158, 98) with radius 69 then Draws a black rectangle at (202, 155) with width 35 and height 28 then Sets a single red pixel at (291, 21).
; PLAN: r0=158(x), r1=98(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=202(x), r6=155(y), r7=35(width), r8=28(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=291(x), r11=21(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 158
LDI r1, 98
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 202
LDI r6, 155
LDI r7, 35
LDI r8, 28
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 291
LDI r11, 21
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
