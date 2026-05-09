; DESCRIPTION: Renders a green disk with center (258, 104) and radius 40.
; PLAN: r0=258(x), r1=104(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 258
LDI r1, 104
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
