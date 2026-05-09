; DESCRIPTION: Composite: Places a magenta dot at position (248, 253) then Creates a magenta circular shape at (330, 92) with radius 60.
; PLAN: r0=248(x), r1=253(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=330(x), r6=92(y), r7=60(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 248
LDI r1, 253
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 330
LDI r6, 92
LDI r7, 60
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
