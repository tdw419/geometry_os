; DESCRIPTION: Creates a red circular shape at (222, 158) with radius 55.
; PLAN: r0=222(x), r1=158(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 158
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
