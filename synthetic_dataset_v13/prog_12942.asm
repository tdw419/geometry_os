; DESCRIPTION: Creates a black circular shape at (428, 86) with radius 52.
; PLAN: r0=428(x), r1=86(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 86
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
