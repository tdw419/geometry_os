; DESCRIPTION: Draws a green circle centered at (346, 91) with radius 23.
; PLAN: r0=346(x), r1=91(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 91
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
