; DESCRIPTION: Draws a green circle centered at (404, 78) with radius 38.
; PLAN: r0=404(x), r1=78(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 78
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
