; DESCRIPTION: Places a magenta circle of radius 21 at center (215, 71).
; PLAN: r0=215(x), r1=71(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 71
LDI r2, 21
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
