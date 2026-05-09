; DESCRIPTION: Places a yellow circle of radius 49 at center (98, 108).
; PLAN: r0=98(x), r1=108(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 108
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
