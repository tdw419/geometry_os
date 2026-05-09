; DESCRIPTION: Composite: Renders a orange disk with center (313, 226) and radius 13 then Sets a single purple pixel at (122, 100).
; PLAN: r0=313(x), r1=226(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=122(x), r6=100(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 313
LDI r1, 226
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 122
LDI r6, 100
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
