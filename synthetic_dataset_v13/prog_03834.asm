; DESCRIPTION: Composite: Sets a single cyan pixel at (455, 72) then Creates a green circular shape at (155, 99) with radius 55.
; PLAN: r0=455(x), r1=72(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=155(x), r6=99(y), r7=55(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 455
LDI r1, 72
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 155
LDI r6, 99
LDI r7, 55
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
