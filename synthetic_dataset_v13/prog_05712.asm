; DESCRIPTION: Creates a green circular shape at (282, 145) with radius 25.
; PLAN: r0=282(x), r1=145(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 282
LDI r1, 145
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
