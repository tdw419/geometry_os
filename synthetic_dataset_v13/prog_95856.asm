; DESCRIPTION: Draws a green circle centered at (404, 191) with radius 52.
; PLAN: r0=404(x), r1=191(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 191
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
