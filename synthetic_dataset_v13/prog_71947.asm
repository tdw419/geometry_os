; DESCRIPTION: Places a magenta circle of radius 34 at center (272, 190).
; PLAN: r0=272(x), r1=190(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 190
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
