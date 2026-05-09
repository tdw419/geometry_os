; DESCRIPTION: Places a magenta circle of radius 42 at center (333, 119).
; PLAN: r0=333(x), r1=119(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 333
LDI r1, 119
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
