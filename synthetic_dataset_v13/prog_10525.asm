; DESCRIPTION: Places a blue circle of radius 44 at center (197, 73).
; PLAN: r0=197(x), r1=73(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 73
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
