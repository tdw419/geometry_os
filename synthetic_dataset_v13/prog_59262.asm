; DESCRIPTION: Draws a red circle centered at (404, 134) with radius 64.
; PLAN: r0=404(x), r1=134(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 134
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
