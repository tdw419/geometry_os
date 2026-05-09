; DESCRIPTION: Renders a green disk with center (411, 211) and radius 14.
; PLAN: r0=411(x), r1=211(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 211
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
