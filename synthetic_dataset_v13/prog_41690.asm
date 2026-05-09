; DESCRIPTION: Draws a white circle centered at (437, 180) with radius 43.
; PLAN: r0=437(x), r1=180(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 437
LDI r1, 180
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
