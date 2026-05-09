; DESCRIPTION: Composite: Draws a orange line from (142, 8) to (438, 106) then Places a blue dot at position (115, 167) then Renders a purple box of size 105x90 starting at (126, 134).
; PLAN: r0=142(x1), r1=8(y1), r2=438(x2), r3=106(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=115(x), r6=167(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=126(x), r11=134(y), r12=105(width), r13=90(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 142
LDI r1, 8
LDI r2, 438
LDI r3, 106
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 167
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 126
LDI r11, 134
LDI r12, 105
LDI r13, 90
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
