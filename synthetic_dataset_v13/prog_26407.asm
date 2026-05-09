; DESCRIPTION: Composite: Creates a green circular shape at (155, 187) with radius 43 then Places a black dot at position (262, 169).
; PLAN: r0=155(x), r1=187(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=262(x), r6=169(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 155
LDI r1, 187
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 262
LDI r6, 169
LDI r7, 0x000000
PSET r5, r6, r7
HALT
