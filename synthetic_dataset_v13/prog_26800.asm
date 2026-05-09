; DESCRIPTION: Places a black circle of radius 21 at center (291, 40).
; PLAN: r0=291(x), r1=40(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 40
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
