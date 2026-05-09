; DESCRIPTION: Composite: Draws a orange rectangle at (173, 163) with width 113 and height 71 then Draws a black circle centered at (311, 117) with radius 24.
; PLAN: r0=173(x), r1=163(y), r2=113(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=311(x), r6=117(y), r7=24(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 173
LDI r1, 163
LDI r2, 113
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 117
LDI r7, 24
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
