; DESCRIPTION: Renders a green disk with center (404, 179) and radius 71.
; PLAN: r0=404(x), r1=179(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 179
LDI r2, 71
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
