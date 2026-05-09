; DESCRIPTION: Places a magenta circle of radius 49 at center (438, 89).
; PLAN: r0=438(x), r1=89(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 438
LDI r1, 89
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
