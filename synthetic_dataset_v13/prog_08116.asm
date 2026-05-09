; DESCRIPTION: Places a blue circle of radius 39 at center (438, 46).
; PLAN: r0=438(x), r1=46(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 438
LDI r1, 46
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
