; DESCRIPTION: Renders a yellow disk with center (156, 37) and radius 20.
; PLAN: r0=156(x), r1=37(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 37
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
