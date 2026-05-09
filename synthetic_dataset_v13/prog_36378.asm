; DESCRIPTION: Places a magenta circle of radius 32 at center (265, 33).
; PLAN: r0=265(x), r1=33(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 265
LDI r1, 33
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
