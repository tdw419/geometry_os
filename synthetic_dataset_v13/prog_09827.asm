; DESCRIPTION: Renders a red disk with center (385, 136) and radius 46.
; PLAN: r0=385(x), r1=136(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 136
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
