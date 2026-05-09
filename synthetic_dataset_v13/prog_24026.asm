; DESCRIPTION: Composite: Renders a orange line between points (30, 15) and (121, 232) then Draws a magenta circle centered at (141, 175) with radius 67.
; PLAN: r0=30(x1), r1=15(y1), r2=121(x2), r3=232(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=141(x), r6=175(y), r7=67(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 30
LDI r1, 15
LDI r2, 121
LDI r3, 232
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 175
LDI r7, 67
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
