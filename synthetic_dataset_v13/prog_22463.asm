; DESCRIPTION: Draws a green circle centered at (237, 45) with radius 10.
; PLAN: r0=237(x), r1=45(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 45
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
