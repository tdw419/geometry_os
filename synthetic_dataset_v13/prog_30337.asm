; DESCRIPTION: Renders a yellow disk with center (136, 186) and radius 64.
; PLAN: r0=136(x), r1=186(y), r2=64(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 186
LDI r2, 64
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
