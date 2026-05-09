; DESCRIPTION: Places a blue circle of radius 28 at center (74, 183).
; PLAN: r0=74(x), r1=183(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 183
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
