; DESCRIPTION: Creates a blue circular shape at (212, 33) with radius 29.
; PLAN: r0=212(x), r1=33(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 33
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
