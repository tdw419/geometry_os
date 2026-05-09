; DESCRIPTION: Renders a green disk with center (403, 75) and radius 55.
; PLAN: r0=403(x), r1=75(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 75
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
