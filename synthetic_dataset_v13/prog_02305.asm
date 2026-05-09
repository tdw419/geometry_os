; DESCRIPTION: Creates a red circular shape at (166, 162) with radius 44.
; PLAN: r0=166(x), r1=162(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 162
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
