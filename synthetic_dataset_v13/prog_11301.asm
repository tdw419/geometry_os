; DESCRIPTION: Renders a green disk with center (254, 94) and radius 72.
; PLAN: r0=254(x), r1=94(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 94
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
