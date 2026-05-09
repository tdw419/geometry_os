; DESCRIPTION: Draws a green circle centered at (171, 89) with radius 79.
; PLAN: r0=171(x), r1=89(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 89
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
