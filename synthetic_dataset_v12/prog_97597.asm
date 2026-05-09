; DESCRIPTION: Composite: Draws a cyan rectangle at (167, 13) with width 110 and height 92 then Creates a white circular shape at (436, 227) with radius 25.
; PLAN: r0=167(x), r1=13(y), r2=110(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=436(x), r6=227(y), r7=25(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 167
LDI r1, 13
LDI r2, 110
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 227
LDI r7, 25
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
