; DESCRIPTION: Composite: Draws a magenta rectangle at (125, 123) with width 92 and height 13 then Creates a red circular shape at (234, 78) with radius 40.
; PLAN: r0=125(x), r1=123(y), r2=92(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=234(x), r6=78(y), r7=40(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 125
LDI r1, 123
LDI r2, 92
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 78
LDI r7, 40
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
