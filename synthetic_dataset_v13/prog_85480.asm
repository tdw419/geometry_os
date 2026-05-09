; DESCRIPTION: Composite: Places a red dot at position (451, 35) then Creates a black circular shape at (384, 97) with radius 71.
; PLAN: r0=451(x), r1=35(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=384(x), r6=97(y), r7=71(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 451
LDI r1, 35
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 384
LDI r6, 97
LDI r7, 71
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
