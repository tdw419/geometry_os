; DESCRIPTION: Draws a green circle centered at (32, 193) with radius 25.
; PLAN: r0=32(x), r1=193(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 32
LDI r1, 193
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
