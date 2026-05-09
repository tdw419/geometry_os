; DESCRIPTION: Creates a black circular shape at (169, 213) with radius 17.
; PLAN: r0=169(x), r1=213(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 213
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
