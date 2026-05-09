; DESCRIPTION: Creates a magenta circular shape at (405, 86) with radius 53.
; PLAN: r0=405(x), r1=86(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 86
LDI r2, 53
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
