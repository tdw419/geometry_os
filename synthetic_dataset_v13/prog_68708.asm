; DESCRIPTION: Composite: Places a purple dot at position (424, 146) then Creates a magenta circular shape at (382, 44) with radius 13.
; PLAN: r0=424(x), r1=146(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=382(x), r6=44(y), r7=13(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 424
LDI r1, 146
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 382
LDI r6, 44
LDI r7, 13
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
