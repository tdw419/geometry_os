; DESCRIPTION: Composite: Places a orange circle of radius 31 at center (295, 101) then Places a red dot at position (119, 123) then Draws a magenta rectangle at (74, 30) with width 62 and height 41.
; PLAN: r0=295(x), r1=101(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=119(x), r6=123(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=74(x), r11=30(y), r12=62(width), r13=41(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 295
LDI r1, 101
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 119
LDI r6, 123
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 74
LDI r11, 30
LDI r12, 62
LDI r13, 41
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
