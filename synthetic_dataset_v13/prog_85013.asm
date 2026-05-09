; DESCRIPTION: Creates a black circular shape at (168, 103) with radius 70.
; PLAN: r0=168(x), r1=103(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 103
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
