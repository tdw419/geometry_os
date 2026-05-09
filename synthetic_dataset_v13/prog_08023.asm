; DESCRIPTION: Composite: Sets a single yellow pixel at (228, 31) then Creates a orange circular shape at (476, 217) with radius 32.
; PLAN: r0=228(x), r1=31(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=476(x), r6=217(y), r7=32(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 228
LDI r1, 31
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 476
LDI r6, 217
LDI r7, 32
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
