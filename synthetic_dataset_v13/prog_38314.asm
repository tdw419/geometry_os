; DESCRIPTION: Renders a green disk with center (298, 185) and radius 69.
; PLAN: r0=298(x), r1=185(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 298
LDI r1, 185
LDI r2, 69
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
