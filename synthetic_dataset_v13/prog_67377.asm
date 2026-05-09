; DESCRIPTION: Creates a green circular shape at (465, 140) with radius 29.
; PLAN: r0=465(x), r1=140(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 465
LDI r1, 140
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
