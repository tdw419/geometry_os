; DESCRIPTION: Places a black circle of radius 36 at center (360, 114).
; PLAN: r0=360(x), r1=114(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 360
LDI r1, 114
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
