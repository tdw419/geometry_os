; DESCRIPTION: Creates a red circular shape at (273, 72) with radius 67.
; PLAN: r0=273(x), r1=72(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 72
LDI r2, 67
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
