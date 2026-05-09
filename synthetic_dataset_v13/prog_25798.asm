; DESCRIPTION: Composite: Places a purple line segment connecting (490, 197) to (73, 187) then Places a purple 52x17 rectangle at position (229, 18) then Sets a single black pixel at (385, 211).
; PLAN: r0=490(x1), r1=197(y1), r2=73(x2), r3=187(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=229(x), r6=18(y), r7=52(width), r8=17(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=385(x), r11=211(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 490
LDI r1, 197
LDI r2, 73
LDI r3, 187
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 18
LDI r7, 52
LDI r8, 17
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 385
LDI r11, 211
LDI r12, 0x000000
PSET r10, r11, r12
HALT
