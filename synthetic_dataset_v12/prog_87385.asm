; DESCRIPTION: Composite: Renders a red disk with center (65, 148) and radius 14 then Places a black dot at position (118, 203).
; PLAN: r0=65(x), r1=148(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=118(x), r6=203(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 65
LDI r1, 148
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 118
LDI r6, 203
LDI r7, 0x000000
PSET r5, r6, r7
HALT
