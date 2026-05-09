; DESCRIPTION: Places a magenta circle of radius 12 at center (493, 204).
; PLAN: r0=493(x), r1=204(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 493
LDI r1, 204
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
