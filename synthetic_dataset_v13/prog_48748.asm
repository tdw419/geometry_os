; DESCRIPTION: Draws a white circle centered at (272, 89) with radius 80.
; PLAN: r0=272(x), r1=89(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 89
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
