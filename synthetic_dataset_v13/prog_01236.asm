; DESCRIPTION: Draws a green circle centered at (113, 46) with radius 21.
; PLAN: r0=113(x), r1=46(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 46
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
