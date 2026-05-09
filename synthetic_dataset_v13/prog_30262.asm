; DESCRIPTION: Places a magenta circle of radius 57 at center (437, 82).
; PLAN: r0=437(x), r1=82(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 437
LDI r1, 82
LDI r2, 57
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
