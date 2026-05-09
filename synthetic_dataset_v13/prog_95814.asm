; DESCRIPTION: Creates a red circular shape at (137, 97) with radius 38.
; PLAN: r0=137(x), r1=97(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 97
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
