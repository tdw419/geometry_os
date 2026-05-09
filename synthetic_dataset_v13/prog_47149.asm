; DESCRIPTION: Places a black circle of radius 55 at center (121, 193).
; PLAN: r0=121(x), r1=193(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 193
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
