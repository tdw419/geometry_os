; DESCRIPTION: Composite: Draws a black rectangle at (278, 116) with width 114 and height 35 then Creates a orange circular shape at (287, 203) with radius 36.
; PLAN: r0=278(x), r1=116(y), r2=114(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=287(x), r6=203(y), r7=36(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 278
LDI r1, 116
LDI r2, 114
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 203
LDI r7, 36
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
