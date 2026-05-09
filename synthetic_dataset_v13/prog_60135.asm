; DESCRIPTION: Composite: Renders a green disk with center (209, 166) and radius 72 then Sets a single black pixel at (407, 120).
; PLAN: r0=209(x), r1=166(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=407(x), r6=120(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 209
LDI r1, 166
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 407
LDI r6, 120
LDI r7, 0x000000
PSET r5, r6, r7
HALT
