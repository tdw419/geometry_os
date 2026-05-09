; DESCRIPTION: Renders a green disk with center (404, 36) and radius 27.
; PLAN: r0=404(x), r1=36(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 36
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
