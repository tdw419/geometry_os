; DESCRIPTION: Creates a red circular shape at (148, 149) with radius 37.
; PLAN: r0=148(x), r1=149(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 149
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
