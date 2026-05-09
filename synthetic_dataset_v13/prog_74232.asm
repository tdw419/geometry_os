; DESCRIPTION: Creates a green circular shape at (404, 47) with radius 12.
; PLAN: r0=404(x), r1=47(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 47
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
