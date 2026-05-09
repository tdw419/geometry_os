; DESCRIPTION: Creates a blue circular shape at (249, 127) with radius 75.
; PLAN: r0=249(x), r1=127(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 127
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
