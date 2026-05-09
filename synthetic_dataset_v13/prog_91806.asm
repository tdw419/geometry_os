; DESCRIPTION: Composite: Sets a single magenta pixel at (55, 128) then Creates a magenta circular shape at (425, 67) with radius 67.
; PLAN: r0=55(x), r1=128(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=425(x), r6=67(y), r7=67(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 55
LDI r1, 128
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 425
LDI r6, 67
LDI r7, 67
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
