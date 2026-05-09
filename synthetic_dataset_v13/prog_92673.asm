; DESCRIPTION: Creates a green circular shape at (419, 95) with radius 68.
; PLAN: r0=419(x), r1=95(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 419
LDI r1, 95
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
