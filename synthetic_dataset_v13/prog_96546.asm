; DESCRIPTION: Composite: Draws a red circle centered at (424, 163) with radius 18 then Creates a black rectangular region at (211, 122) spanning 63 by 90 pixels.
; PLAN: r0=424(x), r1=163(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=211(x), r6=122(y), r7=63(width), r8=90(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 424
LDI r1, 163
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 211
LDI r6, 122
LDI r7, 63
LDI r8, 90
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
