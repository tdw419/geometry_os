; DESCRIPTION: Creates a blue circular shape at (280, 94) with radius 79.
; PLAN: r0=280(x), r1=94(y), r2=79(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 280
LDI r1, 94
LDI r2, 79
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
