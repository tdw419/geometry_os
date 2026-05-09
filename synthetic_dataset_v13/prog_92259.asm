; DESCRIPTION: Renders a green disk with center (391, 141) and radius 79.
; PLAN: r0=391(x), r1=141(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 391
LDI r1, 141
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
