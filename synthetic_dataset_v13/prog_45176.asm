; DESCRIPTION: Creates a yellow circular shape at (84, 66) with radius 58.
; PLAN: r0=84(x), r1=66(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 66
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
