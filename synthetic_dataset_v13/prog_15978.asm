; DESCRIPTION: Creates a blue circular shape at (66, 150) with radius 64.
; PLAN: r0=66(x), r1=150(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 150
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
