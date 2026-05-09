; DESCRIPTION: Creates a blue circular shape at (439, 106) with radius 29.
; PLAN: r0=439(x), r1=106(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 106
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
