; DESCRIPTION: Creates a red circular shape at (186, 32) with radius 29.
; PLAN: r0=186(x), r1=32(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 32
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
