; DESCRIPTION: Composite: Draws a red line from (24, 97) to (259, 46) then Places a cyan dot at position (109, 178) then Draws a cyan rectangle at (15, 148) with width 63 and height 94.
; PLAN: r0=24(x1), r1=97(y1), r2=259(x2), r3=46(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=109(x), r6=178(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=15(x), r11=148(y), r12=63(width), r13=94(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 24
LDI r1, 97
LDI r2, 259
LDI r3, 46
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 178
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 15
LDI r11, 148
LDI r12, 63
LDI r13, 94
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
