; DESCRIPTION: Creates a red circular shape at (44, 80) with radius 40.
; PLAN: r0=44(x), r1=80(y), r2=40(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 80
LDI r2, 40
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
