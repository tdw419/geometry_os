; DESCRIPTION: Draws a green circle centered at (36, 208) with radius 29.
; PLAN: r0=36(x), r1=208(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 36
LDI r1, 208
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
