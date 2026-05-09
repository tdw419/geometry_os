; DESCRIPTION: Creates a red circular shape at (162, 103) with radius 29.
; PLAN: r0=162(x), r1=103(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 103
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
