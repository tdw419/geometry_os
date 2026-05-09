; DESCRIPTION: Draws a white circle centered at (330, 166) with radius 66.
; PLAN: r0=330(x), r1=166(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 330
LDI r1, 166
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
