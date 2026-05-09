; DESCRIPTION: Places a black circle of radius 38 at center (474, 73).
; PLAN: r0=474(x), r1=73(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 474
LDI r1, 73
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
