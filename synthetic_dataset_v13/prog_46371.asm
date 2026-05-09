; DESCRIPTION: Composite: Draws a red circle centered at (136, 104) with radius 77 then Sets a single green pixel at (488, 64).
; PLAN: r0=136(x), r1=104(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=488(x), r6=64(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 136
LDI r1, 104
LDI r2, 77
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 488
LDI r6, 64
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
