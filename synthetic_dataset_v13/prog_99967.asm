; DESCRIPTION: Composite: Places a orange 66x88 rectangle at position (282, 156) then Places a green circle of radius 24 at center (355, 232).
; PLAN: r0=282(x), r1=156(y), r2=66(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=355(x), r6=232(y), r7=24(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 282
LDI r1, 156
LDI r2, 66
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 232
LDI r7, 24
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
