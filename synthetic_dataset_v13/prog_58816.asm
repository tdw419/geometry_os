; DESCRIPTION: Creates a yellow circular shape at (218, 149) with radius 51.
; PLAN: r0=218(x), r1=149(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 149
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
