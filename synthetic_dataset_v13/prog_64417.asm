; DESCRIPTION: Places a magenta circle of radius 50 at center (299, 80).
; PLAN: r0=299(x), r1=80(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 299
LDI r1, 80
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
