; DESCRIPTION: Renders a blue disk with center (404, 229) and radius 11.
; PLAN: r0=404(x), r1=229(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 229
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
