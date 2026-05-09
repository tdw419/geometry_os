; DESCRIPTION: Composite: Sets a single black pixel at (473, 187) then Renders a black disk with center (332, 122) and radius 68.
; PLAN: r0=473(x), r1=187(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=332(x), r6=122(y), r7=68(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 473
LDI r1, 187
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 332
LDI r6, 122
LDI r7, 68
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
