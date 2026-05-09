; DESCRIPTION: Creates a green circular shape at (275, 180) with radius 62.
; PLAN: r0=275(x), r1=180(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 180
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
