; DESCRIPTION: Draws a black circle centered at (410, 157) with radius 75.
; PLAN: r0=410(x), r1=157(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 157
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
