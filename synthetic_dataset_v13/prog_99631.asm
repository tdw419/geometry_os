; DESCRIPTION: Creates a green circular shape at (440, 122) with radius 72.
; PLAN: r0=440(x), r1=122(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 440
LDI r1, 122
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
