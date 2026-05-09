; DESCRIPTION: Composite: Draws a orange circle centered at (139, 120) with radius 62 then Places a green line segment connecting (90, 182) to (118, 63).
; PLAN: r0=139(x), r1=120(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=90(x1), r6=182(y1), r7=118(x2), r8=63(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 139
LDI r1, 120
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 90
LDI r6, 182
LDI r7, 118
LDI r8, 63
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
