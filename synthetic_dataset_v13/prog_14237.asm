; DESCRIPTION: Places a black circle of radius 72 at center (200, 178).
; PLAN: r0=200(x), r1=178(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 178
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
