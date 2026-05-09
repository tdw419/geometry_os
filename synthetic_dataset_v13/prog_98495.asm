; DESCRIPTION: Creates a magenta circular shape at (376, 28) with radius 12.
; PLAN: r0=376(x), r1=28(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 28
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
