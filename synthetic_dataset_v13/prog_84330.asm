; DESCRIPTION: Creates a blue circular shape at (435, 134) with radius 50.
; PLAN: r0=435(x), r1=134(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 435
LDI r1, 134
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
