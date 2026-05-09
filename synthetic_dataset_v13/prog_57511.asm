; DESCRIPTION: Composite: Draws a yellow circle centered at (95, 27) with radius 16 then Places a yellow line segment connecting (478, 24) to (179, 183).
; PLAN: r0=95(x), r1=27(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=478(x1), r6=24(y1), r7=179(x2), r8=183(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 95
LDI r1, 27
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 478
LDI r6, 24
LDI r7, 179
LDI r8, 183
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
