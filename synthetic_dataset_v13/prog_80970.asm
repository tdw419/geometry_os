; DESCRIPTION: Creates a red circular shape at (137, 136) with radius 48.
; PLAN: r0=137(x), r1=136(y), r2=48(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 136
LDI r2, 48
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
