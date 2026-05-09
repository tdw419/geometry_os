; DESCRIPTION: Creates a black circular shape at (305, 171) with radius 52.
; PLAN: r0=305(x), r1=171(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 305
LDI r1, 171
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
