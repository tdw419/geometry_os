; DESCRIPTION: Creates a green circular shape at (442, 140) with radius 56.
; PLAN: r0=442(x), r1=140(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 442
LDI r1, 140
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
