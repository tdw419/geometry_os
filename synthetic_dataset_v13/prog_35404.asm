; DESCRIPTION: Creates a red circular shape at (427, 174) with radius 26.
; PLAN: r0=427(x), r1=174(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 174
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
