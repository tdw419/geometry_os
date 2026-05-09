; DESCRIPTION: Creates a purple circular shape at (404, 70) with radius 17.
; PLAN: r0=404(x), r1=70(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 70
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
