; DESCRIPTION: Composite: Draws a magenta line from (390, 163) to (307, 250) then Places a purple 119x69 rectangle at position (378, 146) then Sets a single blue pixel at (241, 164).
; PLAN: r0=390(x1), r1=163(y1), r2=307(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=378(x), r6=146(y), r7=119(width), r8=69(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=241(x), r11=164(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 390
LDI r1, 163
LDI r2, 307
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 378
LDI r6, 146
LDI r7, 119
LDI r8, 69
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 241
LDI r11, 164
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
