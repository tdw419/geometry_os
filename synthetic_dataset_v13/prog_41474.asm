; DESCRIPTION: Composite: Places a red dot at position (511, 138) then Creates a magenta circular shape at (183, 212) with radius 27.
; PLAN: r0=511(x), r1=138(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=183(x), r6=212(y), r7=27(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 511
LDI r1, 138
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 183
LDI r6, 212
LDI r7, 27
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
