; DESCRIPTION: Places a black circle of radius 48 at center (346, 195).
; PLAN: r0=346(x), r1=195(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 195
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
