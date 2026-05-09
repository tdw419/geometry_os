; DESCRIPTION: Draws a green circle centered at (404, 73) with radius 37.
; PLAN: r0=404(x), r1=73(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 73
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
