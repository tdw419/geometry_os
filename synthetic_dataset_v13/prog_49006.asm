; DESCRIPTION: Composite: Draws a purple circle centered at (334, 203) with radius 42 then Renders a yellow line between points (104, 140) and (390, 239) then Sets a single red pixel at (481, 1).
; PLAN: r0=334(x), r1=203(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=104(x1), r6=140(y1), r7=390(x2), r8=239(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=481(x), r11=1(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 334
LDI r1, 203
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 104
LDI r6, 140
LDI r7, 390
LDI r8, 239
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 481
LDI r11, 1
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
