; DESCRIPTION: Creates a red circular shape at (278, 141) with radius 12.
; PLAN: r0=278(x), r1=141(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 278
LDI r1, 141
LDI r2, 12
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
