; DESCRIPTION: Creates a red circular shape at (208, 114) with radius 76.
; PLAN: r0=208(x), r1=114(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 114
LDI r2, 76
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
