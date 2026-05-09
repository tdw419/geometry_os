; DESCRIPTION: Creates a blue circular shape at (439, 91) with radius 56.
; PLAN: r0=439(x), r1=91(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 91
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
