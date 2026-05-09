; DESCRIPTION: Places a yellow circle of radius 58 at center (375, 71).
; PLAN: r0=375(x), r1=71(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 71
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
