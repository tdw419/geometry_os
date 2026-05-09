; DESCRIPTION: Composite: Places a white line segment connecting (376, 109) to (54, 227) then Draws a magenta circle centered at (267, 159) with radius 79.
; PLAN: r0=376(x1), r1=109(y1), r2=54(x2), r3=227(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=267(x), r6=159(y), r7=79(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 376
LDI r1, 109
LDI r2, 54
LDI r3, 227
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 267
LDI r6, 159
LDI r7, 79
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
