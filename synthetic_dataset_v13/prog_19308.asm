; DESCRIPTION: Draws a yellow circle centered at (217, 152) with radius 18.
; PLAN: r0=217(x), r1=152(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 152
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
