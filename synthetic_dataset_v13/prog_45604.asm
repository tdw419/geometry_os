; DESCRIPTION: Places a magenta circle of radius 57 at center (380, 197).
; PLAN: r0=380(x), r1=197(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 380
LDI r1, 197
LDI r2, 57
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
