; DESCRIPTION: Creates a blue circular shape at (210, 161) with radius 51.
; PLAN: r0=210(x), r1=161(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 161
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
