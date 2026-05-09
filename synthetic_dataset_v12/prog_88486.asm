; DESCRIPTION: Creates a red circular shape at (329, 185) with radius 44.
; PLAN: r0=329(x), r1=185(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 185
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
