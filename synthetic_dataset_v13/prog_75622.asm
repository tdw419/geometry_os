; DESCRIPTION: Places a magenta circle of radius 11 at center (182, 57).
; PLAN: r0=182(x), r1=57(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 57
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
