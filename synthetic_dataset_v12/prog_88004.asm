; DESCRIPTION: Places a yellow circle of radius 32 at center (244, 61).
; PLAN: r0=244(x), r1=61(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 61
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
