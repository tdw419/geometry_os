; DESCRIPTION: Creates a blue circular shape at (400, 125) with radius 66.
; PLAN: r0=400(x), r1=125(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 400
LDI r1, 125
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
