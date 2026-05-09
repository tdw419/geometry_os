; DESCRIPTION: Places a magenta circle of radius 10 at center (75, 32).
; PLAN: r0=75(x), r1=32(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 32
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
