; DESCRIPTION: Creates a yellow circular shape at (317, 83) with radius 61.
; PLAN: r0=317(x), r1=83(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 83
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
