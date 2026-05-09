; DESCRIPTION: Places a black circle of radius 57 at center (267, 69).
; PLAN: r0=267(x), r1=69(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 267
LDI r1, 69
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
