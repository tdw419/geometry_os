; DESCRIPTION: Places a magenta circle of radius 69 at center (309, 82).
; PLAN: r0=309(x), r1=82(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 82
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
