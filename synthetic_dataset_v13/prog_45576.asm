; DESCRIPTION: Creates a white circular shape at (120, 145) with radius 69.
; PLAN: r0=120(x), r1=145(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 145
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
