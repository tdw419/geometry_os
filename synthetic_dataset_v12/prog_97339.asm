; DESCRIPTION: Places a blue circle of radius 16 at center (429, 39).
; PLAN: r0=429(x), r1=39(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 429
LDI r1, 39
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
