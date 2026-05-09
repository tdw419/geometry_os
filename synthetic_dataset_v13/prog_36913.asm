; DESCRIPTION: Creates a magenta circular shape at (50, 177) with radius 39.
; PLAN: r0=50(x), r1=177(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 177
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
