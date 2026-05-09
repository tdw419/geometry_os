; DESCRIPTION: Creates a white circular shape at (176, 120) with radius 25.
; PLAN: r0=176(x), r1=120(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 120
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
