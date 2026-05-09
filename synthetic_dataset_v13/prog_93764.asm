; DESCRIPTION: Places a magenta circle of radius 75 at center (241, 82).
; PLAN: r0=241(x), r1=82(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 82
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
