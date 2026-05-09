; DESCRIPTION: Draws a white circle centered at (136, 150) with radius 71.
; PLAN: r0=136(x), r1=150(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 150
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
