; DESCRIPTION: Composite: Places a black dot at position (311, 12) then Creates a cyan circular shape at (163, 63) with radius 31 then Draws a green rectangle at (348, 135) with width 10 and height 27.
; PLAN: r0=311(x), r1=12(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=163(x), r6=63(y), r7=31(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=348(x), r11=135(y), r12=10(width), r13=27(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 311
LDI r1, 12
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 163
LDI r6, 63
LDI r7, 31
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 348
LDI r11, 135
LDI r12, 10
LDI r13, 27
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
