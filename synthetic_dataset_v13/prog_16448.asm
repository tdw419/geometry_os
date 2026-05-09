; DESCRIPTION: Composite: Draws a blue circle centered at (235, 185) with radius 45 then Places a yellow dot at position (312, 161).
; PLAN: r0=235(x), r1=185(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=312(x), r6=161(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 235
LDI r1, 185
LDI r2, 45
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 312
LDI r6, 161
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
