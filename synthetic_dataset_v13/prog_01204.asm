; DESCRIPTION: Places a yellow circle of radius 32 at center (372, 199).
; PLAN: r0=372(x), r1=199(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 199
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
