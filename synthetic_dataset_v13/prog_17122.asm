; DESCRIPTION: Composite: Renders a red disk with center (175, 97) and radius 67 then Sets a single black pixel at (118, 103).
; PLAN: r0=175(x), r1=97(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=118(x), r6=103(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 175
LDI r1, 97
LDI r2, 67
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 118
LDI r6, 103
LDI r7, 0x000000
PSET r5, r6, r7
HALT
