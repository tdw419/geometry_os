; DESCRIPTION: Composite: Draws a red rectangle at (222, 124) with width 97 and height 20 then Renders a magenta disk with center (99, 90) and radius 58.
; PLAN: r0=222(x), r1=124(y), r2=97(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=99(x), r6=90(y), r7=58(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 222
LDI r1, 124
LDI r2, 97
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 99
LDI r6, 90
LDI r7, 58
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
