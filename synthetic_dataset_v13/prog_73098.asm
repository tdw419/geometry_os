; DESCRIPTION: Places a magenta circle of radius 76 at center (308, 102).
; PLAN: r0=308(x), r1=102(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 102
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
