; DESCRIPTION: Composite: Places a purple dot at position (8, 32) then Draws a red circle centered at (293, 178) with radius 18.
; PLAN: r0=8(x), r1=32(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=293(x), r6=178(y), r7=18(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 8
LDI r1, 32
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 293
LDI r6, 178
LDI r7, 18
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
