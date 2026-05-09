; DESCRIPTION: Draws a green circle centered at (225, 208) with radius 45.
; PLAN: r0=225(x), r1=208(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 208
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
