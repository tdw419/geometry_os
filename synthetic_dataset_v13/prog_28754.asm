; DESCRIPTION: Places a black circle of radius 10 at center (156, 223).
; PLAN: r0=156(x), r1=223(y), r2=10(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 223
LDI r2, 10
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
