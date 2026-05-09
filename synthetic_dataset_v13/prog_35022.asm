; DESCRIPTION: Creates a green circular shape at (337, 118) with radius 65.
; PLAN: r0=337(x), r1=118(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 337
LDI r1, 118
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
