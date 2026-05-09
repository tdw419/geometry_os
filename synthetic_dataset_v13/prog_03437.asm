; DESCRIPTION: Renders a green disk with center (436, 161) and radius 58.
; PLAN: r0=436(x), r1=161(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 436
LDI r1, 161
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
