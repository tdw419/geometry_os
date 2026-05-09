; DESCRIPTION: Renders a green disk with center (407, 65) and radius 36.
; PLAN: r0=407(x), r1=65(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 65
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
