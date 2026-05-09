; DESCRIPTION: Creates a blue circular shape at (343, 46) with radius 42.
; PLAN: r0=343(x), r1=46(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 343
LDI r1, 46
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
