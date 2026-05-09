; DESCRIPTION: Creates a yellow circular shape at (323, 47) with radius 47.
; PLAN: r0=323(x), r1=47(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 47
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
