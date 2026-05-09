; DESCRIPTION: Creates a red circular shape at (135, 118) with radius 69.
; PLAN: r0=135(x), r1=118(y), r2=69(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 118
LDI r2, 69
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
