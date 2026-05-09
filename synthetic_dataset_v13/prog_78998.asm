; DESCRIPTION: Places a green circle of radius 53 at center (164, 121).
; PLAN: r0=164(x), r1=121(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 121
LDI r2, 53
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
