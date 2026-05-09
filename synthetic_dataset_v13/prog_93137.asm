; DESCRIPTION: Composite: Sets a single white pixel at (257, 56) then Creates a green rectangular region at (460, 115) spanning 23 by 114 pixels.
; PLAN: r0=257(x), r1=56(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=460(x), r6=115(y), r7=23(width), r8=114(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 257
LDI r1, 56
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 460
LDI r6, 115
LDI r7, 23
LDI r8, 114
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
