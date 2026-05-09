; DESCRIPTION: Draws a green circle centered at (220, 46) with radius 23.
; PLAN: r0=220(x), r1=46(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 46
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
