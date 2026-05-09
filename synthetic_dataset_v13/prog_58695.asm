; DESCRIPTION: Draws a green circle centered at (315, 149) with radius 25.
; PLAN: r0=315(x), r1=149(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 149
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
