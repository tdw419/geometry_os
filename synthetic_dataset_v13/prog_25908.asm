; DESCRIPTION: Creates a magenta circular shape at (184, 128) with radius 71.
; PLAN: r0=184(x), r1=128(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 128
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
