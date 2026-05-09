; DESCRIPTION: Places a yellow circle of radius 35 at center (128, 194).
; PLAN: r0=128(x), r1=194(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 194
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
