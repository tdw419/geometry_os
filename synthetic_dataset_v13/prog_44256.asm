; DESCRIPTION: Places a black circle of radius 25 at center (197, 170).
; PLAN: r0=197(x), r1=170(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 170
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
