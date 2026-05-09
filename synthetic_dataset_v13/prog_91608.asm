; DESCRIPTION: Composite: Renders a white disk with center (446, 181) and radius 49 then Sets a single yellow pixel at (269, 223).
; PLAN: r0=446(x), r1=181(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=269(x), r6=223(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 446
LDI r1, 181
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 269
LDI r6, 223
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
