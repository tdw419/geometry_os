; DESCRIPTION: Composite: Places a magenta dot at position (195, 251) then Creates a cyan circular shape at (103, 162) with radius 31.
; PLAN: r0=195(x), r1=251(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=103(x), r6=162(y), r7=31(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 195
LDI r1, 251
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 103
LDI r6, 162
LDI r7, 31
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
