; DESCRIPTION: Places a black circle of radius 14 at center (217, 69).
; PLAN: r0=217(x), r1=69(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 69
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
