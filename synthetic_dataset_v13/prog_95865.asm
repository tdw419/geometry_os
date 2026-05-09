; DESCRIPTION: Renders a yellow disk with center (240, 159) and radius 46.
; PLAN: r0=240(x), r1=159(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 240
LDI r1, 159
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
