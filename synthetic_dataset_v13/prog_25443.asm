; DESCRIPTION: Creates a white circular shape at (115, 74) with radius 40.
; PLAN: r0=115(x), r1=74(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 74
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
