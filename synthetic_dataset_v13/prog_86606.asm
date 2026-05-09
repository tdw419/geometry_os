; DESCRIPTION: Composite: Draws a green rectangle at (212, 153) with width 113 and height 13 then Creates a white circular shape at (129, 68) with radius 19.
; PLAN: r0=212(x), r1=153(y), r2=113(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=129(x), r6=68(y), r7=19(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 212
LDI r1, 153
LDI r2, 113
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 68
LDI r7, 19
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
