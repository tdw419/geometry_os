; DESCRIPTION: Places a black circle of radius 57 at center (95, 115).
; PLAN: r0=95(x), r1=115(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 115
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
