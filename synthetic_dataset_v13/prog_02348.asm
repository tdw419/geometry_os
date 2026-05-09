; DESCRIPTION: Draws a green circle centered at (72, 84) with radius 28.
; PLAN: r0=72(x), r1=84(y), r2=28(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 84
LDI r2, 28
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
