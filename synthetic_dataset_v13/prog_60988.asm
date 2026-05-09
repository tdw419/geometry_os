; DESCRIPTION: Composite: Renders a orange line between points (146, 170) and (465, 12) then Places a red circle of radius 53 at center (316, 156) then Sets a single magenta pixel at (135, 150).
; PLAN: r0=146(x1), r1=170(y1), r2=465(x2), r3=12(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=316(x), r6=156(y), r7=53(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=135(x), r11=150(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 146
LDI r1, 170
LDI r2, 465
LDI r3, 12
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 156
LDI r7, 53
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 135
LDI r11, 150
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
