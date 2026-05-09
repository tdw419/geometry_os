; DESCRIPTION: Draws a white circle centered at (281, 170) with radius 77.
; PLAN: r0=281(x), r1=170(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 170
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
