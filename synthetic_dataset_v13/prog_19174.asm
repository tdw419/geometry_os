; DESCRIPTION: Places a yellow circle of radius 57 at center (285, 189).
; PLAN: r0=285(x), r1=189(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 189
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
