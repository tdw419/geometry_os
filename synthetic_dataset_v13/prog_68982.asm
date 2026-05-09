; DESCRIPTION: Creates a black circular shape at (308, 150) with radius 63.
; PLAN: r0=308(x), r1=150(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 150
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
