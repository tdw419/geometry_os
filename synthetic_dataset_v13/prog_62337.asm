; DESCRIPTION: Creates a red circular shape at (303, 188) with radius 19.
; PLAN: r0=303(x), r1=188(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 188
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
