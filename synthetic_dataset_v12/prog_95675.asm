; DESCRIPTION: Composite: Places a white dot at position (73, 78) then Creates a magenta circular shape at (106, 114) with radius 46.
; PLAN: r0=73(x), r1=78(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=106(x), r6=114(y), r7=46(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 73
LDI r1, 78
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 106
LDI r6, 114
LDI r7, 46
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
