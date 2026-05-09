; DESCRIPTION: Composite: Renders a yellow disk with center (69, 156) and radius 54 then Places a blue dot at position (251, 244).
; PLAN: r0=69(x), r1=156(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=251(x), r6=244(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 69
LDI r1, 156
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 251
LDI r6, 244
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
