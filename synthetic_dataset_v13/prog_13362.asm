; DESCRIPTION: Places a black circle of radius 26 at center (439, 171).
; PLAN: r0=439(x), r1=171(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 171
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
