; DESCRIPTION: Composite: Sets a single cyan pixel at (50, 114) then Creates a purple circular shape at (217, 98) with radius 76.
; PLAN: r0=50(x), r1=114(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=217(x), r6=98(y), r7=76(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 50
LDI r1, 114
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 217
LDI r6, 98
LDI r7, 76
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
