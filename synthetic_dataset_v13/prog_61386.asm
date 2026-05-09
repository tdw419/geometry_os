; DESCRIPTION: Creates a yellow circular shape at (433, 68) with radius 51.
; PLAN: r0=433(x), r1=68(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 68
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
