; DESCRIPTION: Renders a green disk with center (180, 78) and radius 55.
; PLAN: r0=180(x), r1=78(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 78
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
