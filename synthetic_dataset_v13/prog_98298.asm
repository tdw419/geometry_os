; DESCRIPTION: Composite: Draws a red rectangle at (357, 195) with width 20 and height 54 then Draws a blue circle centered at (292, 137) with radius 74.
; PLAN: r0=357(x), r1=195(y), r2=20(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=292(x), r6=137(y), r7=74(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 357
LDI r1, 195
LDI r2, 20
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 292
LDI r6, 137
LDI r7, 74
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
