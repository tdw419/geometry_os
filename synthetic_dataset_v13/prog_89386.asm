; DESCRIPTION: Creates a green circular shape at (387, 139) with radius 69.
; PLAN: r0=387(x), r1=139(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 139
LDI r2, 69
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
