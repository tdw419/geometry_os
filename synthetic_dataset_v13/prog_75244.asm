; DESCRIPTION: Renders a green disk with center (448, 55) and radius 46.
; PLAN: r0=448(x), r1=55(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 448
LDI r1, 55
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
