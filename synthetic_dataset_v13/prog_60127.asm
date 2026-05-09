; DESCRIPTION: Composite: Draws a magenta circle centered at (361, 85) with radius 35 then Renders a black line between points (309, 113) and (368, 104).
; PLAN: r0=361(x), r1=85(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=309(x1), r6=113(y1), r7=368(x2), r8=104(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 361
LDI r1, 85
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 309
LDI r6, 113
LDI r7, 368
LDI r8, 104
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
