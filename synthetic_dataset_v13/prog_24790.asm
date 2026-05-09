; DESCRIPTION: Composite: Renders a red disk with center (41, 166) and radius 17 then Sets a single yellow pixel at (39, 153).
; PLAN: r0=41(x), r1=166(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=39(x), r6=153(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 41
LDI r1, 166
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 39
LDI r6, 153
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
