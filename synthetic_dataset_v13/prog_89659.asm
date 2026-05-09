; DESCRIPTION: Draws a green circle centered at (296, 203) with radius 52.
; PLAN: r0=296(x), r1=203(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 203
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
