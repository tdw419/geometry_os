; DESCRIPTION: Creates a red circular shape at (394, 119) with radius 80.
; PLAN: r0=394(x), r1=119(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 119
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
