; DESCRIPTION: Creates a magenta circular shape at (354, 95) with radius 30.
; PLAN: r0=354(x), r1=95(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 354
LDI r1, 95
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
