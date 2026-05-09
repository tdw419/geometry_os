; DESCRIPTION: Composite: Places a black dot at position (180, 178) then Creates a magenta circular shape at (61, 171) with radius 20.
; PLAN: r0=180(x), r1=178(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=61(x), r6=171(y), r7=20(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 180
LDI r1, 178
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 61
LDI r6, 171
LDI r7, 20
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
