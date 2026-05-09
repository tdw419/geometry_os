; DESCRIPTION: Places a magenta circle of radius 12 at center (283, 42).
; PLAN: r0=283(x), r1=42(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 42
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
