; DESCRIPTION: Places a black circle of radius 65 at center (286, 95).
; PLAN: r0=286(x), r1=95(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 95
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
