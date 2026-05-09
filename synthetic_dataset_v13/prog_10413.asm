; DESCRIPTION: Creates a yellow circular shape at (178, 131) with radius 75.
; PLAN: r0=178(x), r1=131(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 131
LDI r2, 75
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
