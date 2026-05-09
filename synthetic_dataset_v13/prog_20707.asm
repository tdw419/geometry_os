; DESCRIPTION: Composite: Creates a purple circular shape at (101, 138) with radius 65 then Draws a red rectangle at (347, 78) with width 53 and height 37.
; PLAN: r0=101(x), r1=138(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=347(x), r6=78(y), r7=53(width), r8=37(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 101
LDI r1, 138
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 347
LDI r6, 78
LDI r7, 53
LDI r8, 37
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
