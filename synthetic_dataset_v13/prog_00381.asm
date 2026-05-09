; DESCRIPTION: Renders a green disk with center (353, 162) and radius 77.
; PLAN: r0=353(x), r1=162(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 162
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
