; DESCRIPTION: Composite: Sets a single magenta pixel at (147, 244) then Draws a orange circle centered at (166, 222) with radius 10.
; PLAN: r0=147(x), r1=244(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=166(x), r6=222(y), r7=10(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 147
LDI r1, 244
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 166
LDI r6, 222
LDI r7, 10
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
