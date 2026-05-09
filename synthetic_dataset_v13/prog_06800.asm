; DESCRIPTION: Composite: Draws a orange rectangle at (378, 183) with width 95 and height 41 then Renders a yellow disk with center (83, 78) and radius 31.
; PLAN: r0=378(x), r1=183(y), r2=95(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=83(x), r6=78(y), r7=31(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 378
LDI r1, 183
LDI r2, 95
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 78
LDI r7, 31
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
