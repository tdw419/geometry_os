; DESCRIPTION: Creates a black circular shape at (193, 150) with radius 42.
; PLAN: r0=193(x), r1=150(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 150
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
