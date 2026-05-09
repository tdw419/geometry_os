; DESCRIPTION: Composite: Draws a purple rectangle at (1, 141) with width 103 and height 115 then Creates a orange circular shape at (338, 97) with radius 15.
; PLAN: r0=1(x), r1=141(y), r2=103(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=338(x), r6=97(y), r7=15(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 1
LDI r1, 141
LDI r2, 103
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 338
LDI r6, 97
LDI r7, 15
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
