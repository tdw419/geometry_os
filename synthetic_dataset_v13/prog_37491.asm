; DESCRIPTION: Composite: Draws a yellow rectangle at (137, 111) with width 107 and height 78 then Creates a green circular shape at (137, 228) with radius 23.
; PLAN: r0=137(x), r1=111(y), r2=107(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=137(x), r6=228(y), r7=23(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 137
LDI r1, 111
LDI r2, 107
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 228
LDI r7, 23
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
