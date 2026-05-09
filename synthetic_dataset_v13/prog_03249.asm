; DESCRIPTION: Composite: Places a black dot at position (319, 197) then Creates a blue circular shape at (99, 85) with radius 38.
; PLAN: r0=319(x), r1=197(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=99(x), r6=85(y), r7=38(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 319
LDI r1, 197
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 99
LDI r6, 85
LDI r7, 38
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
