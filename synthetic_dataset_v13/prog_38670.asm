; DESCRIPTION: Composite: Places a magenta dot at position (345, 217) then Creates a black circular shape at (68, 77) with radius 18.
; PLAN: r0=345(x), r1=217(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=68(x), r6=77(y), r7=18(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 345
LDI r1, 217
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 68
LDI r6, 77
LDI r7, 18
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
