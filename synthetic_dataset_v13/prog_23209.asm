; DESCRIPTION: Places a black circle of radius 25 at center (480, 156).
; PLAN: r0=480(x), r1=156(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 480
LDI r1, 156
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
