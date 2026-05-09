; DESCRIPTION: Creates a red circular shape at (196, 137) with radius 47.
; PLAN: r0=196(x), r1=137(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 137
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
