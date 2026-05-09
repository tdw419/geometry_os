; DESCRIPTION: Creates a red circular shape at (346, 155) with radius 68.
; PLAN: r0=346(x), r1=155(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 155
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
