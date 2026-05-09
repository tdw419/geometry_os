; DESCRIPTION: Composite: Draws a white rectangle at (147, 157) with width 39 and height 25 then Creates a black circular shape at (150, 122) with radius 70.
; PLAN: r0=147(x), r1=157(y), r2=39(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=150(x), r6=122(y), r7=70(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 147
LDI r1, 157
LDI r2, 39
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 150
LDI r6, 122
LDI r7, 70
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
