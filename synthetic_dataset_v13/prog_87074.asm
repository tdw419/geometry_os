; DESCRIPTION: Creates a magenta circular shape at (303, 139) with radius 66.
; PLAN: r0=303(x), r1=139(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 139
LDI r2, 66
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
