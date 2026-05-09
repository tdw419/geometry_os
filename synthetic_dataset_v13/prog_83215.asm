; DESCRIPTION: Draws a white circle centered at (363, 122) with radius 40.
; PLAN: r0=363(x), r1=122(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 122
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
