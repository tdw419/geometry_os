; DESCRIPTION: Composite: Draws a purple rectangle at (132, 149) with width 100 and height 82 then Places a blue dot at position (126, 4) then Draws a cyan line from (183, 72) to (350, 145).
; PLAN: r0=132(x), r1=149(y), r2=100(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=126(x), r6=4(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=183(x1), r11=72(y1), r12=350(x2), r13=145(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 132
LDI r1, 149
LDI r2, 100
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 4
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 183
LDI r11, 72
LDI r12, 350
LDI r13, 145
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
