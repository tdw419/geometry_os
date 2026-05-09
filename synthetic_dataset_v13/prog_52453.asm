; DESCRIPTION: Composite: Draws a magenta rectangle at (124, 12) with width 54 and height 88 then Draws a red circle centered at (348, 110) with radius 73.
; PLAN: r0=124(x), r1=12(y), r2=54(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=348(x), r6=110(y), r7=73(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 124
LDI r1, 12
LDI r2, 54
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 110
LDI r7, 73
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
