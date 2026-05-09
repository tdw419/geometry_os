; DESCRIPTION: Places a magenta circle of radius 69 at center (85, 164).
; PLAN: r0=85(x), r1=164(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 164
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
