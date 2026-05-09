; DESCRIPTION: Composite: Draws a blue rectangle at (14, 100) with width 65 and height 83 then Places a purple line segment connecting (401, 156) to (326, 98) then Sets a single blue pixel at (114, 109).
; PLAN: r0=14(x), r1=100(y), r2=65(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=401(x1), r6=156(y1), r7=326(x2), r8=98(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=114(x), r11=109(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 14
LDI r1, 100
LDI r2, 65
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 156
LDI r7, 326
LDI r8, 98
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 114
LDI r11, 109
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
