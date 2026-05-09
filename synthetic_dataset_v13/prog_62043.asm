; DESCRIPTION: Draws a cyan circle centered at (404, 199) with radius 22.
; PLAN: r0=404(x), r1=199(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 199
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
