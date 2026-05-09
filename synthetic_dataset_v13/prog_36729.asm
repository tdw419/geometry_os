; DESCRIPTION: Draws a green circle centered at (171, 171) with radius 57.
; PLAN: r0=171(x), r1=171(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 171
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
