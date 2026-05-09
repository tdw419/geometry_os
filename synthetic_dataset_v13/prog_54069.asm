; DESCRIPTION: Places a magenta circle of radius 69 at center (212, 156).
; PLAN: r0=212(x), r1=156(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 156
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
