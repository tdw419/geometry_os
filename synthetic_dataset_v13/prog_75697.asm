; DESCRIPTION: Places a yellow circle of radius 17 at center (385, 148).
; PLAN: r0=385(x), r1=148(y), r2=17(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 148
LDI r2, 17
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
