; DESCRIPTION: Creates a red circular shape at (212, 170) with radius 33.
; PLAN: r0=212(x), r1=170(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 170
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
