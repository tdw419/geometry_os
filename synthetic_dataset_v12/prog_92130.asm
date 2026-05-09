; DESCRIPTION: Creates a blue circular shape at (109, 146) with radius 56.
; PLAN: r0=109(x), r1=146(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 146
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
