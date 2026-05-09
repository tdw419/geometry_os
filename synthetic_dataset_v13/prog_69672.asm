; DESCRIPTION: Renders a green disk with center (165, 89) and radius 43.
; PLAN: r0=165(x), r1=89(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 89
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
