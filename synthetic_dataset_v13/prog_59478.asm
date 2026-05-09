; DESCRIPTION: Places a magenta circle of radius 63 at center (285, 148).
; PLAN: r0=285(x), r1=148(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 148
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
