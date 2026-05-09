; DESCRIPTION: Places a black circle of radius 70 at center (292, 124).
; PLAN: r0=292(x), r1=124(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 124
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
