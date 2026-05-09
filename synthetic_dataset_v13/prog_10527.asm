; DESCRIPTION: Places a magenta circle of radius 39 at center (71, 60).
; PLAN: r0=71(x), r1=60(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 60
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
