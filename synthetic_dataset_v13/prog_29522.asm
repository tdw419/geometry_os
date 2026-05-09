; DESCRIPTION: Renders a green disk with center (58, 185) and radius 57.
; PLAN: r0=58(x), r1=185(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 58
LDI r1, 185
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
