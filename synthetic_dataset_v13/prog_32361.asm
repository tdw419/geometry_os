; DESCRIPTION: Composite: Draws a white rectangle at (261, 15) with width 100 and height 92 then Creates a white circular shape at (436, 158) with radius 40.
; PLAN: r0=261(x), r1=15(y), r2=100(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=436(x), r6=158(y), r7=40(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 261
LDI r1, 15
LDI r2, 100
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 158
LDI r7, 40
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
