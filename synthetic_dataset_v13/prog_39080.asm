; DESCRIPTION: Draws a white circle centered at (260, 170) with radius 72.
; PLAN: r0=260(x), r1=170(y), r2=72(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 260
LDI r1, 170
LDI r2, 72
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
