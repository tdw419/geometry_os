; DESCRIPTION: Composite: Sets a single blue pixel at (134, 178) then Draws a orange circle centered at (336, 194) with radius 29.
; PLAN: r0=134(x), r1=178(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=336(x), r6=194(y), r7=29(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 134
LDI r1, 178
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 336
LDI r6, 194
LDI r7, 29
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
