; DESCRIPTION: Places a yellow circle of radius 19 at center (223, 108).
; PLAN: r0=223(x), r1=108(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 108
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
