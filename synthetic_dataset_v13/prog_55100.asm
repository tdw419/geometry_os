; DESCRIPTION: Draws a white circle centered at (126, 171) with radius 12.
; PLAN: r0=126(x), r1=171(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 171
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
