; DESCRIPTION: Composite: Draws a white line from (442, 163) to (476, 159) then Renders a purple box of size 104x41 starting at (391, 188) then Places a green dot at position (411, 202).
; PLAN: r0=442(x1), r1=163(y1), r2=476(x2), r3=159(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=391(x), r6=188(y), r7=104(width), r8=41(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=411(x), r11=202(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 442
LDI r1, 163
LDI r2, 476
LDI r3, 159
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 188
LDI r7, 104
LDI r8, 41
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 411
LDI r11, 202
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
