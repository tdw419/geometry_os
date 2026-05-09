; DESCRIPTION: Creates a magenta circular shape at (337, 76) with radius 75.
; PLAN: r0=337(x), r1=76(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 337
LDI r1, 76
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
