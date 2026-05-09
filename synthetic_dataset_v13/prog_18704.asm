; DESCRIPTION: Composite: Draws a cyan line from (307, 159) to (147, 123) then Places a blue dot at position (250, 153) then Places a black 85x43 rectangle at position (123, 179).
; PLAN: r0=307(x1), r1=159(y1), r2=147(x2), r3=123(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=250(x), r6=153(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=123(x), r11=179(y), r12=85(width), r13=43(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 307
LDI r1, 159
LDI r2, 147
LDI r3, 123
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 250
LDI r6, 153
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 123
LDI r11, 179
LDI r12, 85
LDI r13, 43
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
