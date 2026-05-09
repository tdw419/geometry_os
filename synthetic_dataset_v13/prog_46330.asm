; DESCRIPTION: Composite: Draws a cyan circle centered at (370, 153) with radius 29 then Places a green dot at position (179, 159).
; PLAN: r0=370(x), r1=153(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=179(x), r6=159(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 370
LDI r1, 153
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 179
LDI r6, 159
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
