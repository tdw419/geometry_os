; DESCRIPTION: Creates a green circular shape at (25, 79) with radius 20.
; PLAN: r0=25(x), r1=79(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 25
LDI r1, 79
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
