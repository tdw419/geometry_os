; DESCRIPTION: Composite: Places a magenta dot at position (481, 14) then Creates a white circular shape at (206, 156) with radius 78.
; PLAN: r0=481(x), r1=14(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=206(x), r6=156(y), r7=78(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 481
LDI r1, 14
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 206
LDI r6, 156
LDI r7, 78
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
