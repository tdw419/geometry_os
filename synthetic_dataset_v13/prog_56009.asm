; DESCRIPTION: Composite: Places a magenta dot at position (261, 203) then Places a black circle of radius 66 at center (85, 130).
; PLAN: r0=261(x), r1=203(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=85(x), r6=130(y), r7=66(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 261
LDI r1, 203
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 85
LDI r6, 130
LDI r7, 66
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
