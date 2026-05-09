; DESCRIPTION: Creates a blue circular shape at (327, 149) with radius 66.
; PLAN: r0=327(x), r1=149(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 327
LDI r1, 149
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
