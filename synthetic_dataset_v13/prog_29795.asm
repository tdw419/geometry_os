; DESCRIPTION: Renders a yellow disk with center (404, 150) and radius 33.
; PLAN: r0=404(x), r1=150(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 150
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
