; DESCRIPTION: Composite: Places a white line segment connecting (158, 197) to (327, 143) then Draws a purple circle centered at (114, 176) with radius 62 then Sets a single cyan pixel at (315, 207).
; PLAN: r0=158(x1), r1=197(y1), r2=327(x2), r3=143(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=114(x), r6=176(y), r7=62(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=315(x), r11=207(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 158
LDI r1, 197
LDI r2, 327
LDI r3, 143
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 114
LDI r6, 176
LDI r7, 62
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 315
LDI r11, 207
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
