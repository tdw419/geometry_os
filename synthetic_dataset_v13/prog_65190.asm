; DESCRIPTION: Composite: Draws a red rectangle at (444, 136) with width 49 and height 120 then Creates a green circular shape at (154, 63) with radius 62.
; PLAN: r0=444(x), r1=136(y), r2=49(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=154(x), r6=63(y), r7=62(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 444
LDI r1, 136
LDI r2, 49
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 63
LDI r7, 62
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
