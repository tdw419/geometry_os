; DESCRIPTION: Draws a green circle centered at (240, 16) with radius 10.
; PLAN: r0=240(x), r1=16(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 240
LDI r1, 16
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
