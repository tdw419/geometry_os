; DESCRIPTION: Places a black circle of radius 35 at center (121, 214).
; PLAN: r0=121(x), r1=214(y), r2=35(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 214
LDI r2, 35
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
