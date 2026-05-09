; DESCRIPTION: Renders a yellow disk with center (415, 155) and radius 48.
; PLAN: r0=415(x), r1=155(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 415
LDI r1, 155
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
