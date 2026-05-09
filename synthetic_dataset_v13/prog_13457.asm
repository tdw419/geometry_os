; DESCRIPTION: Composite: Sets a single blue pixel at (143, 184) then Creates a red circular shape at (309, 164) with radius 66.
; PLAN: r0=143(x), r1=184(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=309(x), r6=164(y), r7=66(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 143
LDI r1, 184
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 309
LDI r6, 164
LDI r7, 66
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
