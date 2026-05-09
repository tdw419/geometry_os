; DESCRIPTION: Composite: Draws a green circle centered at (88, 113) with radius 79 then Places a green dot at position (42, 233).
; PLAN: r0=88(x), r1=113(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=42(x), r6=233(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 88
LDI r1, 113
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 42
LDI r6, 233
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
