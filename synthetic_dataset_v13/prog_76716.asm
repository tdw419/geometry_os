; DESCRIPTION: Places a black circle of radius 39 at center (300, 55).
; PLAN: r0=300(x), r1=55(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 300
LDI r1, 55
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
