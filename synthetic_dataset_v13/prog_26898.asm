; DESCRIPTION: Places a magenta circle of radius 42 at center (385, 184).
; PLAN: r0=385(x), r1=184(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 184
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
