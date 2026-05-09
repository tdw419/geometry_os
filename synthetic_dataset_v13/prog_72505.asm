; DESCRIPTION: Draws a white circle centered at (465, 102) with radius 26.
; PLAN: r0=465(x), r1=102(y), r2=26(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 465
LDI r1, 102
LDI r2, 26
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
