; DESCRIPTION: Creates a magenta circular shape at (49, 190) with radius 47.
; PLAN: r0=49(x), r1=190(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 190
LDI r2, 47
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
