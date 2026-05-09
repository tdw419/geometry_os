; DESCRIPTION: Composite: Draws a white circle centered at (227, 109) with radius 65 then Places a magenta dot at position (137, 244).
; PLAN: r0=227(x), r1=109(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=137(x), r6=244(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 227
LDI r1, 109
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 137
LDI r6, 244
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
