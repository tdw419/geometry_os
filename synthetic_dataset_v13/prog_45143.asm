; DESCRIPTION: Places a black circle of radius 43 at center (240, 207).
; PLAN: r0=240(x), r1=207(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 240
LDI r1, 207
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
