; DESCRIPTION: Renders a yellow disk with center (192, 66) and radius 57.
; PLAN: r0=192(x), r1=66(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 66
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
