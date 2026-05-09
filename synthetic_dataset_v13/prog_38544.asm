; DESCRIPTION: Creates a blue circular shape at (236, 164) with radius 54.
; PLAN: r0=236(x), r1=164(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 164
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
