; DESCRIPTION: Places a magenta circle of radius 57 at center (346, 139).
; PLAN: r0=346(x), r1=139(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 139
LDI r2, 57
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
