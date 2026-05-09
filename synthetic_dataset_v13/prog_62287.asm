; DESCRIPTION: Places a black circle of radius 32 at center (237, 95).
; PLAN: r0=237(x), r1=95(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 95
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
