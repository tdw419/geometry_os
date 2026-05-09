; DESCRIPTION: Places a magenta circle of radius 76 at center (417, 82).
; PLAN: r0=417(x), r1=82(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 82
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
