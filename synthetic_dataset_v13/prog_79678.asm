; DESCRIPTION: Composite: Places a white dot at position (64, 251) then Creates a magenta circular shape at (138, 130) with radius 74.
; PLAN: r0=64(x), r1=251(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=138(x), r6=130(y), r7=74(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 64
LDI r1, 251
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 138
LDI r6, 130
LDI r7, 74
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
