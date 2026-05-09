; DESCRIPTION: Composite: Draws a magenta rectangle at (361, 118) with width 78 and height 73 then Places a magenta circle of radius 13 at center (169, 159).
; PLAN: r0=361(x), r1=118(y), r2=78(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=169(x), r6=159(y), r7=13(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 361
LDI r1, 118
LDI r2, 78
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 159
LDI r7, 13
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
