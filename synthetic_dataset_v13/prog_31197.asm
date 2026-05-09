; DESCRIPTION: Creates a green circular shape at (69, 163) with radius 68.
; PLAN: r0=69(x), r1=163(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 163
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
