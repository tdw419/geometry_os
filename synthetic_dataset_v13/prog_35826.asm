; DESCRIPTION: Composite: Sets a single magenta pixel at (246, 200) then Draws a orange circle centered at (382, 144) with radius 29.
; PLAN: r0=246(x), r1=200(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=382(x), r6=144(y), r7=29(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 246
LDI r1, 200
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 382
LDI r6, 144
LDI r7, 29
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
