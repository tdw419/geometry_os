; DESCRIPTION: Creates a blue circular shape at (138, 146) with radius 13.
; PLAN: r0=138(x), r1=146(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 146
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
