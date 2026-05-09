; DESCRIPTION: Places a yellow circle of radius 33 at center (341, 188).
; PLAN: r0=341(x), r1=188(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 188
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
