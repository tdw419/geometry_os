; DESCRIPTION: Composite: Renders a orange box of size 37x17 starting at (302, 195) then Places a green line segment connecting (126, 37) to (72, 31) then Places a purple dot at position (378, 190).
; PLAN: r0=302(x), r1=195(y), r2=37(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=126(x1), r6=37(y1), r7=72(x2), r8=31(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=378(x), r11=190(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 302
LDI r1, 195
LDI r2, 37
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 37
LDI r7, 72
LDI r8, 31
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 378
LDI r11, 190
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
