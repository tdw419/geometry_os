; DESCRIPTION: Creates a magenta circular shape at (405, 78) with radius 68.
; PLAN: r0=405(x), r1=78(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 78
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
