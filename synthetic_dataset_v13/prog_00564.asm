; DESCRIPTION: Composite: Places a yellow dot at position (76, 35) then Draws a black circle centered at (407, 96) with radius 50.
; PLAN: r0=76(x), r1=35(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=407(x), r6=96(y), r7=50(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 76
LDI r1, 35
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 407
LDI r6, 96
LDI r7, 50
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
