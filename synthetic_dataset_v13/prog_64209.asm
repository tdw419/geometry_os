; DESCRIPTION: Draws a white circle centered at (301, 46) with radius 37.
; PLAN: r0=301(x), r1=46(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 301
LDI r1, 46
LDI r2, 37
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
