; DESCRIPTION: Creates a white circular shape at (274, 70) with radius 50.
; PLAN: r0=274(x), r1=70(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 70
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
