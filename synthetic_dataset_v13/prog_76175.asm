; DESCRIPTION: Creates a yellow circular shape at (372, 180) with radius 23.
; PLAN: r0=372(x), r1=180(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 180
LDI r2, 23
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
