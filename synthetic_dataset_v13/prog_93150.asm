; DESCRIPTION: Creates a yellow circular shape at (78, 127) with radius 38.
; PLAN: r0=78(x), r1=127(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 127
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
