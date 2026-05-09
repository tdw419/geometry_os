; DESCRIPTION: Creates a black circular shape at (207, 121) with radius 50.
; PLAN: r0=207(x), r1=121(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 121
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
