; DESCRIPTION: Creates a yellow circular shape at (196, 113) with radius 28.
; PLAN: r0=196(x), r1=113(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 113
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
