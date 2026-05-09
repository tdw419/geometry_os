; DESCRIPTION: Creates a green circular shape at (102, 131) with radius 21.
; PLAN: r0=102(x), r1=131(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 131
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
