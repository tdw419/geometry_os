; DESCRIPTION: Places a black circle of radius 12 at center (237, 195).
; PLAN: r0=237(x), r1=195(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 195
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
