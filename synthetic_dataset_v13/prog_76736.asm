; DESCRIPTION: Composite: Places a magenta dot at position (164, 23) then Draws a purple circle centered at (262, 148) with radius 77.
; PLAN: r0=164(x), r1=23(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=262(x), r6=148(y), r7=77(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 164
LDI r1, 23
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 262
LDI r6, 148
LDI r7, 77
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
