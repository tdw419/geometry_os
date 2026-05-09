; DESCRIPTION: Creates a magenta circular shape at (246, 114) with radius 69.
; PLAN: r0=246(x), r1=114(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 114
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
