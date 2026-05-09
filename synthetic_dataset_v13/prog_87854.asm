; DESCRIPTION: Creates a green circular shape at (168, 69) with radius 45.
; PLAN: r0=168(x), r1=69(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 69
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
