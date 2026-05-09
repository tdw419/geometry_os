; DESCRIPTION: Creates a green circular shape at (131, 162) with radius 36.
; PLAN: r0=131(x), r1=162(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 162
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
