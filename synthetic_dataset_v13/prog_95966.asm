; DESCRIPTION: Places a magenta circle of radius 32 at center (184, 168).
; PLAN: r0=184(x), r1=168(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 168
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
