; DESCRIPTION: Creates a red circular shape at (106, 115) with radius 17.
; PLAN: r0=106(x), r1=115(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 115
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
