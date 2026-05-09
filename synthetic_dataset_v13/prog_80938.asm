; DESCRIPTION: Creates a yellow circular shape at (394, 145) with radius 70.
; PLAN: r0=394(x), r1=145(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 145
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
