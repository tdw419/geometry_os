; DESCRIPTION: Composite: Draws a red circle centered at (461, 181) with radius 13 then Places a green dot at position (169, 155).
; PLAN: r0=461(x), r1=181(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=169(x), r6=155(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 461
LDI r1, 181
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 169
LDI r6, 155
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
