; DESCRIPTION: Draws a white circle centered at (87, 52) with radius 47.
; PLAN: r0=87(x), r1=52(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 52
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
