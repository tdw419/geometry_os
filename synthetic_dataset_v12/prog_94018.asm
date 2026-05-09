; DESCRIPTION: Composite: Sets a single yellow pixel at (60, 6) then Draws a cyan circle centered at (427, 136) with radius 80.
; PLAN: r0=60(x), r1=6(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=427(x), r6=136(y), r7=80(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 60
LDI r1, 6
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 427
LDI r6, 136
LDI r7, 80
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
