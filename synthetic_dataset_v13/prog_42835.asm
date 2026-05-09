; DESCRIPTION: Creates a blue circular shape at (186, 189) with radius 28.
; PLAN: r0=186(x), r1=189(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 189
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
