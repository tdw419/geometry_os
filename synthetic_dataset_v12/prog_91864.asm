; DESCRIPTION: Places a black circle of radius 61 at center (197, 175).
; PLAN: r0=197(x), r1=175(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 175
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
