; DESCRIPTION: Draws a green circle centered at (425, 138) with radius 14.
; PLAN: r0=425(x), r1=138(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 425
LDI r1, 138
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
