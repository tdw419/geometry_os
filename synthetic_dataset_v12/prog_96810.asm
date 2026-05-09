; DESCRIPTION: Places a yellow circle of radius 69 at center (371, 108).
; PLAN: r0=371(x), r1=108(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 108
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
