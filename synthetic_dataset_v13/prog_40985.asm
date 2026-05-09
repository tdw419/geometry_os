; DESCRIPTION: Composite: Draws a purple circle centered at (281, 123) with radius 65 then Places a white dot at position (0, 169).
; PLAN: r0=281(x), r1=123(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=0(x), r6=169(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 281
LDI r1, 123
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 0
LDI r6, 169
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
