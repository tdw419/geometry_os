; DESCRIPTION: Draws a black circle centered at (91, 152) with radius 30.
; PLAN: r0=91(x), r1=152(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 152
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
