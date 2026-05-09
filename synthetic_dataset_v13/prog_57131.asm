; DESCRIPTION: Draws a white circle centered at (365, 118) with radius 40.
; PLAN: r0=365(x), r1=118(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 118
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
