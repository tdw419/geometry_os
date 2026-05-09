; DESCRIPTION: Places a black circle of radius 23 at center (168, 69).
; PLAN: r0=168(x), r1=69(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 69
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
