; DESCRIPTION: Creates a red circular shape at (90, 152) with radius 62.
; PLAN: r0=90(x), r1=152(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 152
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
