; DESCRIPTION: Places a blue circle of radius 53 at center (317, 196).
; PLAN: r0=317(x), r1=196(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 196
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
