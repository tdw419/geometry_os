; DESCRIPTION: Creates a black circular shape at (404, 129) with radius 70.
; PLAN: r0=404(x), r1=129(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 129
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
