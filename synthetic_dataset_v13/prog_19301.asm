; DESCRIPTION: Creates a black circular shape at (404, 153) with radius 69.
; PLAN: r0=404(x), r1=153(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 153
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
