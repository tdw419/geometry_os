; DESCRIPTION: Renders a green disk with center (104, 154) and radius 77.
; PLAN: r0=104(x), r1=154(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 154
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
