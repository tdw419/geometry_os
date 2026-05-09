; DESCRIPTION: Places a green circle of radius 33 at center (436, 67).
; PLAN: r0=436(x), r1=67(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 436
LDI r1, 67
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
