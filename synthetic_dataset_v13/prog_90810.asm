; DESCRIPTION: Renders a green disk with center (172, 160) and radius 78.
; PLAN: r0=172(x), r1=160(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 160
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
