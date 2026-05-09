; DESCRIPTION: Creates a yellow circular shape at (108, 160) with radius 20.
; PLAN: r0=108(x), r1=160(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 160
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
