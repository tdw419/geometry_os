; DESCRIPTION: Creates a red circular shape at (141, 166) with radius 66.
; PLAN: r0=141(x), r1=166(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 166
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
