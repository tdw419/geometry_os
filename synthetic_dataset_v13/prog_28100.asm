; DESCRIPTION: Renders a green disk with center (200, 125) and radius 77.
; PLAN: r0=200(x), r1=125(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 125
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
