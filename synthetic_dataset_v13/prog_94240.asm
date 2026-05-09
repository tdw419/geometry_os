; DESCRIPTION: Creates a magenta circular shape at (311, 212) with radius 27.
; PLAN: r0=311(x), r1=212(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 212
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
