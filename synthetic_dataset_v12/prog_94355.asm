; DESCRIPTION: Creates a blue circular shape at (171, 120) with radius 49.
; PLAN: r0=171(x), r1=120(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 120
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
