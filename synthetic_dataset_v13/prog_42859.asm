; DESCRIPTION: Creates a green circular shape at (110, 168) with radius 11.
; PLAN: r0=110(x), r1=168(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 168
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
