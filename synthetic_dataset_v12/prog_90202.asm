; DESCRIPTION: Renders a green disk with center (340, 162) and radius 37.
; PLAN: r0=340(x), r1=162(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 340
LDI r1, 162
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
