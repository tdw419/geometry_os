; DESCRIPTION: Composite: Renders a red disk with center (277, 86) and radius 39 then Sets a single blue pixel at (500, 166).
; PLAN: r0=277(x), r1=86(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=500(x), r6=166(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 277
LDI r1, 86
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 500
LDI r6, 166
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
