; DESCRIPTION: Creates a blue circular shape at (185, 124) with radius 80.
; PLAN: r0=185(x), r1=124(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 124
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
