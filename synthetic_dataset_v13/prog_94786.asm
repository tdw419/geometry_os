; DESCRIPTION: Creates a green circular shape at (292, 115) with radius 71.
; PLAN: r0=292(x), r1=115(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 115
LDI r2, 71
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
