; DESCRIPTION: Composite: Places a magenta dot at position (148, 145) then Draws a black circle centered at (117, 191) with radius 25.
; PLAN: r0=148(x), r1=145(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=117(x), r6=191(y), r7=25(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 148
LDI r1, 145
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 117
LDI r6, 191
LDI r7, 25
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
