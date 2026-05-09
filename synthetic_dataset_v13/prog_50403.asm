; DESCRIPTION: Creates a magenta circular shape at (105, 182) with radius 44.
; PLAN: r0=105(x), r1=182(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 182
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
