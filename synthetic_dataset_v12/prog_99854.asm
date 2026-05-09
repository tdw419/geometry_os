; DESCRIPTION: Draws a white circle centered at (301, 124) with radius 29.
; PLAN: r0=301(x), r1=124(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 301
LDI r1, 124
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
