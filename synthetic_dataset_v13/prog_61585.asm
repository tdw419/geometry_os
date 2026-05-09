; DESCRIPTION: Renders a green disk with center (118, 141) and radius 65.
; PLAN: r0=118(x), r1=141(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 141
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
