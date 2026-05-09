; DESCRIPTION: Places a magenta circle of radius 45 at center (249, 100).
; PLAN: r0=249(x), r1=100(y), r2=45(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 100
LDI r2, 45
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
