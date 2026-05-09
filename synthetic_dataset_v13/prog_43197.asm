; DESCRIPTION: Draws a green circle centered at (18, 215) with radius 10.
; PLAN: r0=18(x), r1=215(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 18
LDI r1, 215
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
