; DESCRIPTION: Composite: Places a purple dot at position (510, 157) then Creates a magenta circular shape at (40, 178) with radius 23.
; PLAN: r0=510(x), r1=157(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=40(x), r6=178(y), r7=23(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 510
LDI r1, 157
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 40
LDI r6, 178
LDI r7, 23
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
