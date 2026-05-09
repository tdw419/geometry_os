; DESCRIPTION: Renders a purple disk with center (404, 186) and radius 56.
; PLAN: r0=404(x), r1=186(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 186
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
