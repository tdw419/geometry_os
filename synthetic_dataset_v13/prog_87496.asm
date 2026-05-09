; DESCRIPTION: Creates a black circular shape at (363, 168) with radius 16.
; PLAN: r0=363(x), r1=168(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 168
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
