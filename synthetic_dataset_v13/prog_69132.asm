; DESCRIPTION: Composite: Sets a single cyan pixel at (289, 37) then Draws a white circle centered at (105, 172) with radius 72.
; PLAN: r0=289(x), r1=37(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=105(x), r6=172(y), r7=72(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 289
LDI r1, 37
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 105
LDI r6, 172
LDI r7, 72
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
