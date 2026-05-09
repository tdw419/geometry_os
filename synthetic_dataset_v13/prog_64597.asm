; DESCRIPTION: Creates a yellow circular shape at (366, 170) with radius 21.
; PLAN: r0=366(x), r1=170(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 170
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
