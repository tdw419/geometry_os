; DESCRIPTION: Places a black circle of radius 73 at center (394, 167).
; PLAN: r0=394(x), r1=167(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 167
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
