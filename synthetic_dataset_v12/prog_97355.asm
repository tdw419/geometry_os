; DESCRIPTION: Creates a red circular shape at (403, 28) with radius 11.
; PLAN: r0=403(x), r1=28(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 28
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
