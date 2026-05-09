; DESCRIPTION: Creates a black circular shape at (374, 226) with radius 20.
; PLAN: r0=374(x), r1=226(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 226
LDI r2, 20
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
