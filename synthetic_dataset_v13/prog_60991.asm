; DESCRIPTION: Composite: Sets a single cyan pixel at (12, 27) then Creates a black circular shape at (454, 146) with radius 37.
; PLAN: r0=12(x), r1=27(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=454(x), r6=146(y), r7=37(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 12
LDI r1, 27
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 454
LDI r6, 146
LDI r7, 37
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
