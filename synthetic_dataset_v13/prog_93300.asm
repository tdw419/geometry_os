; DESCRIPTION: Composite: Renders a magenta disk with center (303, 149) and radius 26 then Sets a single green pixel at (120, 245).
; PLAN: r0=303(x), r1=149(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=120(x), r6=245(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 303
LDI r1, 149
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 120
LDI r6, 245
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
