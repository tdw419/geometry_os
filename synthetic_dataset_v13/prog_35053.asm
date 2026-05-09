; DESCRIPTION: Places a magenta circle of radius 28 at center (262, 94).
; PLAN: r0=262(x), r1=94(y), r2=28(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 94
LDI r2, 28
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
