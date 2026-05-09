; DESCRIPTION: Composite: Creates a red rectangular region at (438, 78) spanning 68 by 10 pixels then Draws a cyan circle centered at (385, 130) with radius 36.
; PLAN: r0=438(x), r1=78(y), r2=68(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=385(x), r6=130(y), r7=36(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 438
LDI r1, 78
LDI r2, 68
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 385
LDI r6, 130
LDI r7, 36
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
