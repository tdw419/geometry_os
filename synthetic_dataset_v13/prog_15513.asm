; DESCRIPTION: Places a yellow circle of radius 65 at center (134, 108).
; PLAN: r0=134(x), r1=108(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 108
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
