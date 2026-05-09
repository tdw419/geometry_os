; DESCRIPTION: Draws a white circle centered at (75, 138) with radius 48.
; PLAN: r0=75(x), r1=138(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 138
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
