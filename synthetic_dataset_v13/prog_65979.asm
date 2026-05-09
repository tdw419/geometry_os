; DESCRIPTION: Creates a blue circular shape at (340, 115) with radius 75.
; PLAN: r0=340(x), r1=115(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 340
LDI r1, 115
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
