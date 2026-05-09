; DESCRIPTION: Creates a red circular shape at (186, 67) with radius 22.
; PLAN: r0=186(x), r1=67(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 67
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
