; DESCRIPTION: Renders a cyan disk with center (404, 123) and radius 29.
; PLAN: r0=404(x), r1=123(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 123
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
