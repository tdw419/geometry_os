; DESCRIPTION: Places a magenta circle of radius 49 at center (317, 142).
; PLAN: r0=317(x), r1=142(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 142
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
