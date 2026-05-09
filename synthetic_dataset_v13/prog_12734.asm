; DESCRIPTION: Creates a magenta circular shape at (265, 115) with radius 79.
; PLAN: r0=265(x), r1=115(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 265
LDI r1, 115
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
