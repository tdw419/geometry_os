; DESCRIPTION: Places a black circle of radius 35 at center (206, 153).
; PLAN: r0=206(x), r1=153(y), r2=35(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 153
LDI r2, 35
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
