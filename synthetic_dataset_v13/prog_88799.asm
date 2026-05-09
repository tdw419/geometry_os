; DESCRIPTION: Composite: Renders a red disk with center (166, 185) and radius 19 then Sets a single purple pixel at (227, 16).
; PLAN: r0=166(x), r1=185(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=227(x), r6=16(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 166
LDI r1, 185
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 227
LDI r6, 16
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
