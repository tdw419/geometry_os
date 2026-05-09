; DESCRIPTION: Renders a green disk with center (349, 141) and radius 71.
; PLAN: r0=349(x), r1=141(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 141
LDI r2, 71
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
