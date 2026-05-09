; DESCRIPTION: Renders a green disk with center (241, 125) and radius 73.
; PLAN: r0=241(x), r1=125(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 125
LDI r2, 73
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
