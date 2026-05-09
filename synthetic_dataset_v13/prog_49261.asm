; DESCRIPTION: Composite: Sets a single yellow pixel at (17, 82) then Draws a blue circle centered at (254, 26) with radius 19.
; PLAN: r0=17(x), r1=82(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=254(x), r6=26(y), r7=19(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 17
LDI r1, 82
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 254
LDI r6, 26
LDI r7, 19
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
