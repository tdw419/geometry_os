; DESCRIPTION: Places a black circle of radius 30 at center (472, 117).
; PLAN: r0=472(x), r1=117(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 472
LDI r1, 117
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
