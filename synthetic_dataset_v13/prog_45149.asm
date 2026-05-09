; DESCRIPTION: Draws a white circle centered at (171, 70) with radius 65.
; PLAN: r0=171(x), r1=70(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 70
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
