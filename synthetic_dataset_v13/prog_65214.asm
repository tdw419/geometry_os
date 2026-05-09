; DESCRIPTION: Draws a green circle centered at (401, 66) with radius 13.
; PLAN: r0=401(x), r1=66(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 66
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
