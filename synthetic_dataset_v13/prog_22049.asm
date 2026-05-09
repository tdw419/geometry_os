; DESCRIPTION: Draws a green circle centered at (78, 152) with radius 19.
; PLAN: r0=78(x), r1=152(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 152
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
