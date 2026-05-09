; DESCRIPTION: Creates a blue circular shape at (295, 75) with radius 33.
; PLAN: r0=295(x), r1=75(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 75
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
