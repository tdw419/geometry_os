; DESCRIPTION: Composite: Renders a magenta disk with center (215, 181) and radius 29 then Sets a single green pixel at (457, 189).
; PLAN: r0=215(x), r1=181(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=457(x), r6=189(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 215
LDI r1, 181
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 457
LDI r6, 189
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
