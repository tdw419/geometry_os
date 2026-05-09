; DESCRIPTION: Creates a red circular shape at (137, 109) with radius 54.
; PLAN: r0=137(x), r1=109(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 109
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
