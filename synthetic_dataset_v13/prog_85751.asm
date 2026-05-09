; DESCRIPTION: Composite: Places a green dot at position (67, 51) then Creates a purple circular shape at (441, 228) with radius 15.
; PLAN: r0=67(x), r1=51(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=441(x), r6=228(y), r7=15(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 67
LDI r1, 51
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 441
LDI r6, 228
LDI r7, 15
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
