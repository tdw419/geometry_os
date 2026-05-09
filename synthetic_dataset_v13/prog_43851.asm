; DESCRIPTION: Creates a red circular shape at (160, 141) with radius 26.
; PLAN: r0=160(x), r1=141(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 141
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
