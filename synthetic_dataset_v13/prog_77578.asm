; DESCRIPTION: Creates a yellow circular shape at (213, 160) with radius 22.
; PLAN: r0=213(x), r1=160(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 160
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
