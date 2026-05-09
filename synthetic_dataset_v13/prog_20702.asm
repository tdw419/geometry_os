; DESCRIPTION: Composite: Sets a single magenta pixel at (264, 113) then Places a orange line segment connecting (292, 97) to (354, 125) then Creates a yellow circular shape at (318, 131) with radius 11.
; PLAN: r0=264(x), r1=113(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=292(x1), r6=97(y1), r7=354(x2), r8=125(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=318(x), r11=131(y), r12=11(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 264
LDI r1, 113
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 292
LDI r6, 97
LDI r7, 354
LDI r8, 125
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 318
LDI r11, 131
LDI r12, 11
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
