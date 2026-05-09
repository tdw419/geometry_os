; DESCRIPTION: Creates a black circular shape at (400, 95) with radius 79.
; PLAN: r0=400(x), r1=95(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 400
LDI r1, 95
LDI r2, 79
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
