; DESCRIPTION: Creates a blue circular shape at (160, 171) with radius 36.
; PLAN: r0=160(x), r1=171(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 171
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
