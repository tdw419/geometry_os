; DESCRIPTION: Places a magenta circle of radius 34 at center (396, 96).
; PLAN: r0=396(x), r1=96(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 96
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
