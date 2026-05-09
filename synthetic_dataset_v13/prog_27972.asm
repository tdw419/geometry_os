; DESCRIPTION: Places a magenta circle of radius 60 at center (177, 195).
; PLAN: r0=177(x), r1=195(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 195
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
