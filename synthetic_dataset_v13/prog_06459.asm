; DESCRIPTION: Creates a black circular shape at (220, 95) with radius 53.
; PLAN: r0=220(x), r1=95(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 95
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
