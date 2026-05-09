; DESCRIPTION: Composite: Draws a orange rectangle at (341, 36) with width 25 and height 68 then Draws a white circle centered at (234, 95) with radius 37.
; PLAN: r0=341(x), r1=36(y), r2=25(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=234(x), r6=95(y), r7=37(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 341
LDI r1, 36
LDI r2, 25
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 95
LDI r7, 37
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
