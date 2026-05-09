; DESCRIPTION: Composite: Creates a orange circular shape at (296, 58) with radius 45 then Draws a magenta rectangle at (246, 99) with width 90 and height 11.
; PLAN: r0=296(x), r1=58(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=246(x), r6=99(y), r7=90(width), r8=11(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 296
LDI r1, 58
LDI r2, 45
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 246
LDI r6, 99
LDI r7, 90
LDI r8, 11
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
