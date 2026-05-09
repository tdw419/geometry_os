; DESCRIPTION: Places a black circle of radius 67 at center (183, 82).
; PLAN: r0=183(x), r1=82(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 82
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
