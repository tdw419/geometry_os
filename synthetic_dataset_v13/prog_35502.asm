; DESCRIPTION: Places a blue circle of radius 43 at center (438, 131).
; PLAN: r0=438(x), r1=131(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 438
LDI r1, 131
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
