; DESCRIPTION: Composite: Creates a black circular shape at (439, 171) with radius 68 then Draws a black rectangle at (282, 32) with width 19 and height 50.
; PLAN: r0=439(x), r1=171(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=282(x), r6=32(y), r7=19(width), r8=50(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 439
LDI r1, 171
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 282
LDI r6, 32
LDI r7, 19
LDI r8, 50
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
