; DESCRIPTION: Renders a green disk with center (112, 124) and radius 65.
; PLAN: r0=112(x), r1=124(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 124
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
