; DESCRIPTION: Composite: Places a purple line segment connecting (258, 55) to (137, 221) then Draws a magenta circle centered at (119, 85) with radius 80.
; PLAN: r0=258(x1), r1=55(y1), r2=137(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=119(x), r6=85(y), r7=80(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 258
LDI r1, 55
LDI r2, 137
LDI r3, 221
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 85
LDI r7, 80
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
