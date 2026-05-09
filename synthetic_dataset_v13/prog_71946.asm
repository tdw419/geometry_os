; DESCRIPTION: Composite: Places a purple dot at position (492, 77) then Places a purple circle of radius 51 at center (306, 156).
; PLAN: r0=492(x), r1=77(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=306(x), r6=156(y), r7=51(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 492
LDI r1, 77
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 306
LDI r6, 156
LDI r7, 51
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
