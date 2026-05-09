; DESCRIPTION: Composite: Renders a yellow disk with center (223, 135) and radius 68 then Sets a single green pixel at (192, 24).
; PLAN: r0=223(x), r1=135(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=192(x), r6=24(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 223
LDI r1, 135
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 192
LDI r6, 24
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
