; DESCRIPTION: Draws a white circle centered at (446, 171) with radius 26.
; PLAN: r0=446(x), r1=171(y), r2=26(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 446
LDI r1, 171
LDI r2, 26
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
