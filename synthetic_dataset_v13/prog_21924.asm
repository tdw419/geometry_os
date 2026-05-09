; DESCRIPTION: Draws a white circle centered at (144, 91) with radius 10.
; PLAN: r0=144(x), r1=91(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 91
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
