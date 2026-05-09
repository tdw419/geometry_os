; DESCRIPTION: Renders a yellow disk with center (404, 122) and radius 28.
; PLAN: r0=404(x), r1=122(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 122
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
