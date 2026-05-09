; DESCRIPTION: Places a black circle of radius 49 at center (327, 167).
; PLAN: r0=327(x), r1=167(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 327
LDI r1, 167
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
