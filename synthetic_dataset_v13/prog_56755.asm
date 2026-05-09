; DESCRIPTION: Creates a blue circular shape at (213, 185) with radius 19.
; PLAN: r0=213(x), r1=185(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 185
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
