; DESCRIPTION: Composite: Draws a cyan circle centered at (151, 237) with radius 11 then Creates a red rectangular region at (155, 58) spanning 25 by 62 pixels.
; PLAN: r0=151(x), r1=237(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=155(x), r6=58(y), r7=25(width), r8=62(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 151
LDI r1, 237
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 155
LDI r6, 58
LDI r7, 25
LDI r8, 62
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
