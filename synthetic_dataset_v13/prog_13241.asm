; DESCRIPTION: Composite: Places a orange line segment connecting (265, 241) to (281, 5) then Draws a magenta circle centered at (457, 203) with radius 49.
; PLAN: r0=265(x1), r1=241(y1), r2=281(x2), r3=5(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=457(x), r6=203(y), r7=49(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 265
LDI r1, 241
LDI r2, 281
LDI r3, 5
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 457
LDI r6, 203
LDI r7, 49
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
