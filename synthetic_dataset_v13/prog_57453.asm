; DESCRIPTION: Places a black circle of radius 66 at center (288, 121).
; PLAN: r0=288(x), r1=121(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 288
LDI r1, 121
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
