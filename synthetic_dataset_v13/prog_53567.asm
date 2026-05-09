; DESCRIPTION: Draws a green circle centered at (384, 160) with radius 66.
; PLAN: r0=384(x), r1=160(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 160
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
