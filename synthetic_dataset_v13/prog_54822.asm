; DESCRIPTION: Draws a white circle centered at (319, 47) with radius 38.
; PLAN: r0=319(x), r1=47(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 319
LDI r1, 47
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
