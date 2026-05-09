; DESCRIPTION: Creates a magenta circular shape at (347, 42) with radius 24.
; PLAN: r0=347(x), r1=42(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 347
LDI r1, 42
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
