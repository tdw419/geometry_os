; DESCRIPTION: Composite: Draws a orange rectangle at (134, 109) with width 60 and height 111 then Creates a white circular shape at (17, 44) with radius 15.
; PLAN: r0=134(x), r1=109(y), r2=60(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=17(x), r6=44(y), r7=15(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 134
LDI r1, 109
LDI r2, 60
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 17
LDI r6, 44
LDI r7, 15
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
