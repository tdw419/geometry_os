; DESCRIPTION: Creates a black circular shape at (450, 140) with radius 28.
; PLAN: r0=450(x), r1=140(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 450
LDI r1, 140
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
