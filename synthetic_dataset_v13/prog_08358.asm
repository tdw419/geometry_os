; DESCRIPTION: Creates a white circular shape at (349, 80) with radius 65.
; PLAN: r0=349(x), r1=80(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 80
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
