; DESCRIPTION: Composite: Renders a cyan line between points (316, 6) and (181, 6) then Draws a black circle centered at (246, 79) with radius 79.
; PLAN: r0=316(x1), r1=6(y1), r2=181(x2), r3=6(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=246(x), r6=79(y), r7=79(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 316
LDI r1, 6
LDI r2, 181
LDI r3, 6
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 246
LDI r6, 79
LDI r7, 79
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
