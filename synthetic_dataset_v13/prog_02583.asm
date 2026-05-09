; DESCRIPTION: Composite: Places a purple dot at position (157, 242) then Creates a black circular shape at (78, 177) with radius 39.
; PLAN: r0=157(x), r1=242(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=78(x), r6=177(y), r7=39(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 157
LDI r1, 242
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 78
LDI r6, 177
LDI r7, 39
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
