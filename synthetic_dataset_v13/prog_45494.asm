; DESCRIPTION: Composite: Places a magenta dot at position (393, 6) then Creates a black circular shape at (363, 141) with radius 52.
; PLAN: r0=393(x), r1=6(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=363(x), r6=141(y), r7=52(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 393
LDI r1, 6
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 363
LDI r6, 141
LDI r7, 52
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
