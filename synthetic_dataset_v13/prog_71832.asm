; DESCRIPTION: Draws a green circle centered at (220, 127) with radius 47.
; PLAN: r0=220(x), r1=127(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 127
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
