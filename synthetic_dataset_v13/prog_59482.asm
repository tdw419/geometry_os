; DESCRIPTION: Composite: Draws a orange circle centered at (113, 170) with radius 56 then Draws a red rectangle at (57, 101) with width 55 and height 78.
; PLAN: r0=113(x), r1=170(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=57(x), r6=101(y), r7=55(width), r8=78(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 113
LDI r1, 170
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 57
LDI r6, 101
LDI r7, 55
LDI r8, 78
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
