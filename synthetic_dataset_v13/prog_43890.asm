; DESCRIPTION: Places a black circle of radius 69 at center (244, 95).
; PLAN: r0=244(x), r1=95(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 95
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
