; DESCRIPTION: Draws a green circle centered at (171, 132) with radius 61.
; PLAN: r0=171(x), r1=132(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 132
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
