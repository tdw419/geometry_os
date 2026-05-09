; DESCRIPTION: Composite: Draws a yellow circle centered at (477, 34) with radius 13 then Places a green line segment connecting (417, 193) to (272, 68).
; PLAN: r0=477(x), r1=34(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=417(x1), r6=193(y1), r7=272(x2), r8=68(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 477
LDI r1, 34
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 417
LDI r6, 193
LDI r7, 272
LDI r8, 68
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
