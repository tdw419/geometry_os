; DESCRIPTION: Places a magenta circle of radius 31 at center (380, 207).
; PLAN: r0=380(x), r1=207(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 380
LDI r1, 207
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
