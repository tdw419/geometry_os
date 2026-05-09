; DESCRIPTION: Composite: Creates a blue circular shape at (276, 82) with radius 78 then Draws a yellow rectangle at (137, 176) with width 31 and height 56.
; PLAN: r0=276(x), r1=82(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=137(x), r6=176(y), r7=31(width), r8=56(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 276
LDI r1, 82
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 137
LDI r6, 176
LDI r7, 31
LDI r8, 56
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
