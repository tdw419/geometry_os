; DESCRIPTION: Creates a green circular shape at (161, 117) with radius 75.
; PLAN: r0=161(x), r1=117(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 117
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
