; DESCRIPTION: Places a blue circle of radius 60 at center (299, 165).
; PLAN: r0=299(x), r1=165(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 299
LDI r1, 165
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
