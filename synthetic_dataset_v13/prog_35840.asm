; DESCRIPTION: Creates a green circular shape at (218, 37) with radius 35.
; PLAN: r0=218(x), r1=37(y), r2=35(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 37
LDI r2, 35
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
