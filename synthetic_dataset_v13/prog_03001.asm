; DESCRIPTION: Places a black circle of radius 36 at center (178, 40).
; PLAN: r0=178(x), r1=40(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 40
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
