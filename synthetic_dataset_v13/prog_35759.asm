; DESCRIPTION: Composite: Renders a red disk with center (270, 44) and radius 43 then Sets a single black pixel at (182, 224).
; PLAN: r0=270(x), r1=44(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=182(x), r6=224(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 270
LDI r1, 44
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 182
LDI r6, 224
LDI r7, 0x000000
PSET r5, r6, r7
HALT
