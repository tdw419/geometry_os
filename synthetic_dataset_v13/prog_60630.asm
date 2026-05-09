; DESCRIPTION: Composite: Sets a single yellow pixel at (384, 165) then Draws a orange circle centered at (324, 108) with radius 43.
; PLAN: r0=384(x), r1=165(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=324(x), r6=108(y), r7=43(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 384
LDI r1, 165
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 324
LDI r6, 108
LDI r7, 43
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
