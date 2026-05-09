; DESCRIPTION: Composite: Places a magenta dot at position (71, 213) then Creates a black circular shape at (426, 121) with radius 31.
; PLAN: r0=71(x), r1=213(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=426(x), r6=121(y), r7=31(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 71
LDI r1, 213
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 426
LDI r6, 121
LDI r7, 31
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
