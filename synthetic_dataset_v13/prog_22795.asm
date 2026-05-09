; DESCRIPTION: Places a black circle of radius 68 at center (408, 84).
; PLAN: r0=408(x), r1=84(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 408
LDI r1, 84
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
