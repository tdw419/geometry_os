; DESCRIPTION: Draws a blue circle centered at (393, 126) with radius 13.
; PLAN: r0=393(x), r1=126(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 126
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
