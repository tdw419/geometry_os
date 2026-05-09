; DESCRIPTION: Creates a yellow circular shape at (428, 78) with radius 58.
; PLAN: r0=428(x), r1=78(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 78
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
