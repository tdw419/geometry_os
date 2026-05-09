; DESCRIPTION: Composite: Places a red dot at position (189, 13) then Creates a magenta circular shape at (276, 77) with radius 68.
; PLAN: r0=189(x), r1=13(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=276(x), r6=77(y), r7=68(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 189
LDI r1, 13
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 276
LDI r6, 77
LDI r7, 68
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
