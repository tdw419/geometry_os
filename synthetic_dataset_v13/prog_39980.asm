; DESCRIPTION: Composite: Sets a single magenta pixel at (431, 210) then Draws a orange circle centered at (381, 161) with radius 26.
; PLAN: r0=431(x), r1=210(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=381(x), r6=161(y), r7=26(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 431
LDI r1, 210
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 381
LDI r6, 161
LDI r7, 26
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
