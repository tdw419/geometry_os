; DESCRIPTION: Draws a green circle centered at (95, 122) with radius 25.
; PLAN: r0=95(x), r1=122(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 122
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
