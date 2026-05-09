; DESCRIPTION: Creates a orange circular shape at (404, 132) with radius 35.
; PLAN: r0=404(x), r1=132(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 132
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
