; DESCRIPTION: Places a yellow circle of radius 17 at center (230, 199).
; PLAN: r0=230(x), r1=199(y), r2=17(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 199
LDI r2, 17
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
