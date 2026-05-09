; DESCRIPTION: Places a yellow circle of radius 67 at center (385, 71).
; PLAN: r0=385(x), r1=71(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 71
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
