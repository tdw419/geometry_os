; DESCRIPTION: Composite: Places a white dot at position (286, 159) then Places a magenta circle of radius 23 at center (454, 104).
; PLAN: r0=286(x), r1=159(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=454(x), r6=104(y), r7=23(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 286
LDI r1, 159
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 454
LDI r6, 104
LDI r7, 23
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
