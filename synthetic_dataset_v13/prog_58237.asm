; DESCRIPTION: Composite: Places a red dot at position (105, 74) then Creates a magenta circular shape at (431, 68) with radius 58.
; PLAN: r0=105(x), r1=74(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=431(x), r6=68(y), r7=58(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 105
LDI r1, 74
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 431
LDI r6, 68
LDI r7, 58
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
