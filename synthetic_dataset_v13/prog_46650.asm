; DESCRIPTION: Places a black circle of radius 57 at center (442, 79).
; PLAN: r0=442(x), r1=79(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 442
LDI r1, 79
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
