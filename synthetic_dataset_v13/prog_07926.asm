; DESCRIPTION: Creates a red circular shape at (33, 170) with radius 26.
; PLAN: r0=33(x), r1=170(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 33
LDI r1, 170
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
