; DESCRIPTION: Composite: Draws a purple rectangle at (383, 110) with width 58 and height 10 then Places a black line segment connecting (467, 2) to (272, 95) then Places a cyan dot at position (201, 56).
; PLAN: r0=383(x), r1=110(y), r2=58(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=467(x1), r6=2(y1), r7=272(x2), r8=95(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=201(x), r11=56(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 383
LDI r1, 110
LDI r2, 58
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 2
LDI r7, 272
LDI r8, 95
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 201
LDI r11, 56
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
