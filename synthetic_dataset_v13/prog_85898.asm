; DESCRIPTION: Renders a yellow disk with center (156, 125) and radius 49.
; PLAN: r0=156(x), r1=125(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 125
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
