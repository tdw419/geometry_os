; DESCRIPTION: Places a black circle of radius 54 at center (96, 183).
; PLAN: r0=96(x), r1=183(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 183
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
