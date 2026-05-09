; DESCRIPTION: Creates a red circular shape at (135, 90) with radius 73.
; PLAN: r0=135(x), r1=90(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 90
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
