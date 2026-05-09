; DESCRIPTION: Draws a white circle centered at (471, 50) with radius 38.
; PLAN: r0=471(x), r1=50(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 471
LDI r1, 50
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
