; DESCRIPTION: Creates a yellow circular shape at (433, 220) with radius 23.
; PLAN: r0=433(x), r1=220(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 220
LDI r2, 23
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
