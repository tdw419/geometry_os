; DESCRIPTION: Composite: Places a magenta dot at position (10, 233) then Creates a black circular shape at (86, 104) with radius 29.
; PLAN: r0=10(x), r1=233(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=86(x), r6=104(y), r7=29(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 10
LDI r1, 233
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 86
LDI r6, 104
LDI r7, 29
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
