; DESCRIPTION: Places a magenta circle of radius 41 at center (397, 109).
; PLAN: r0=397(x), r1=109(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 109
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
