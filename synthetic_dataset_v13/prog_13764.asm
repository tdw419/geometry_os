; DESCRIPTION: Creates a blue circular shape at (365, 189) with radius 16.
; PLAN: r0=365(x), r1=189(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 189
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
