; DESCRIPTION: Places a blue circle of radius 25 at center (157, 184).
; PLAN: r0=157(x), r1=184(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 184
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
