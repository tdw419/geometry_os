; DESCRIPTION: Draws a green circle centered at (75, 209) with radius 34.
; PLAN: r0=75(x), r1=209(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 209
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
