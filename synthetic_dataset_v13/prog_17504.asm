; DESCRIPTION: Places a black circle of radius 70 at center (178, 88).
; PLAN: r0=178(x), r1=88(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 88
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
