; DESCRIPTION: Creates a yellow circular shape at (251, 74) with radius 10.
; PLAN: r0=251(x), r1=74(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 251
LDI r1, 74
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
