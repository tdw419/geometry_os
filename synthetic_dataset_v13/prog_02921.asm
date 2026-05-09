; DESCRIPTION: Composite: Renders a orange line between points (119, 115) and (404, 182) then Draws a magenta circle centered at (316, 95) with radius 56 then Sets a single red pixel at (238, 41).
; PLAN: r0=119(x1), r1=115(y1), r2=404(x2), r3=182(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=316(x), r6=95(y), r7=56(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=238(x), r11=41(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 119
LDI r1, 115
LDI r2, 404
LDI r3, 182
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 95
LDI r7, 56
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 238
LDI r11, 41
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
