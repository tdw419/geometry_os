; DESCRIPTION: Creates a red circular shape at (382, 162) with radius 14.
; PLAN: r0=382(x), r1=162(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 162
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
