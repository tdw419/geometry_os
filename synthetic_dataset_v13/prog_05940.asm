; DESCRIPTION: Composite: Sets a single yellow pixel at (327, 162) then Draws a black circle centered at (234, 84) with radius 17.
; PLAN: r0=327(x), r1=162(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=234(x), r6=84(y), r7=17(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 327
LDI r1, 162
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 234
LDI r6, 84
LDI r7, 17
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
