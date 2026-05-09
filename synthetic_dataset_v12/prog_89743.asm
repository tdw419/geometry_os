; DESCRIPTION: Creates a orange circular shape at (404, 155) with radius 17.
; PLAN: r0=404(x), r1=155(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 155
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
