; DESCRIPTION: Creates a white circular shape at (363, 120) with radius 70.
; PLAN: r0=363(x), r1=120(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 120
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
