; DESCRIPTION: Creates a green circular shape at (131, 59) with radius 55.
; PLAN: r0=131(x), r1=59(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 59
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
