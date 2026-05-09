; DESCRIPTION: Creates a red circular shape at (250, 87) with radius 80.
; PLAN: r0=250(x), r1=87(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 87
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
