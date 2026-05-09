; DESCRIPTION: Places a yellow circle of radius 35 at center (357, 210).
; PLAN: r0=357(x), r1=210(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 357
LDI r1, 210
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
