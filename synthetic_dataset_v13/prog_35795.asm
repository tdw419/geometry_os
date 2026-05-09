; DESCRIPTION: Creates a red circular shape at (149, 115) with radius 65.
; PLAN: r0=149(x), r1=115(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 115
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
