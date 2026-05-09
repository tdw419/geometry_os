; DESCRIPTION: Composite: Places a green 60x52 rectangle at position (382, 182) then Draws a purple line from (68, 96) to (508, 68) then Creates a white circular shape at (449, 90) with radius 43.
; PLAN: r0=382(x), r1=182(y), r2=60(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=68(x1), r6=96(y1), r7=508(x2), r8=68(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=449(x), r11=90(y), r12=43(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 382
LDI r1, 182
LDI r2, 60
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 96
LDI r7, 508
LDI r8, 68
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 449
LDI r11, 90
LDI r12, 43
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
