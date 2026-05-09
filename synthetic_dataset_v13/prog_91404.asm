; DESCRIPTION: Creates a blue circular shape at (444, 213) with radius 33.
; PLAN: r0=444(x), r1=213(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 444
LDI r1, 213
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
