; DESCRIPTION: Creates a red circular shape at (72, 115) with radius 68.
; PLAN: r0=72(x), r1=115(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 115
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
