; DESCRIPTION: Composite: Places a yellow dot at position (37, 63) then Creates a white circular shape at (200, 66) with radius 60.
; PLAN: r0=37(x), r1=63(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=200(x), r6=66(y), r7=60(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 37
LDI r1, 63
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 200
LDI r6, 66
LDI r7, 60
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
