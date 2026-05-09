; DESCRIPTION: Composite: Creates a blue circular shape at (322, 99) with radius 72 then Draws a orange rectangle at (122, 29) with width 34 and height 75.
; PLAN: r0=322(x), r1=99(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=122(x), r6=29(y), r7=34(width), r8=75(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 322
LDI r1, 99
LDI r2, 72
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 122
LDI r6, 29
LDI r7, 34
LDI r8, 75
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
