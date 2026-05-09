; DESCRIPTION: Composite: Creates a black circular shape at (325, 134) with radius 15 then Places a yellow line segment connecting (285, 98) to (166, 197).
; PLAN: r0=325(x), r1=134(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=285(x1), r6=98(y1), r7=166(x2), r8=197(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 325
LDI r1, 134
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 285
LDI r6, 98
LDI r7, 166
LDI r8, 197
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
