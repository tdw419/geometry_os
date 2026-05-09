; DESCRIPTION: Renders a purple disk with center (404, 139) and radius 60.
; PLAN: r0=404(x), r1=139(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 139
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
