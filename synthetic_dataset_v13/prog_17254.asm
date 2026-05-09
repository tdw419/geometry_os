; DESCRIPTION: Composite: Sets a single black pixel at (172, 42) then Creates a magenta circular shape at (78, 130) with radius 18.
; PLAN: r0=172(x), r1=42(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=78(x), r6=130(y), r7=18(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 172
LDI r1, 42
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 78
LDI r6, 130
LDI r7, 18
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
