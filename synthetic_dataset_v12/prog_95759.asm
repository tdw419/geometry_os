; DESCRIPTION: Composite: Draws a red rectangle at (24, 145) with width 70 and height 78 then Draws a orange circle centered at (17, 130) with radius 14.
; PLAN: r0=24(x), r1=145(y), r2=70(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=17(x), r6=130(y), r7=14(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 24
LDI r1, 145
LDI r2, 70
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 17
LDI r6, 130
LDI r7, 14
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
