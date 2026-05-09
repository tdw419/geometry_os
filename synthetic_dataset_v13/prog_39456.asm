; DESCRIPTION: Creates a blue circular shape at (213, 171) with radius 33.
; PLAN: r0=213(x), r1=171(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 171
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
