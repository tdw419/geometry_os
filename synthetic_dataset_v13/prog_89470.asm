; DESCRIPTION: Creates a magenta circular shape at (376, 146) with radius 73.
; PLAN: r0=376(x), r1=146(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 146
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
