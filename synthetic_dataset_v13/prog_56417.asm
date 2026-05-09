; DESCRIPTION: Draws a white circle centered at (163, 187) with radius 56.
; PLAN: r0=163(x), r1=187(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 187
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
