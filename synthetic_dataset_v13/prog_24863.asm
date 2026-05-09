; DESCRIPTION: Composite: Draws a purple circle centered at (37, 120) with radius 21 then Places a yellow line segment connecting (261, 25) to (361, 42) then Places a red dot at position (508, 130).
; PLAN: r0=37(x), r1=120(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=261(x1), r6=25(y1), r7=361(x2), r8=42(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=508(x), r11=130(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 37
LDI r1, 120
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 261
LDI r6, 25
LDI r7, 361
LDI r8, 42
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 508
LDI r11, 130
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
