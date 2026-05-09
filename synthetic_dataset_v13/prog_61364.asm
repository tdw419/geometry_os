; DESCRIPTION: Composite: Places a black dot at position (505, 162) then Draws a black line from (272, 62) to (44, 84) then Places a green 68x112 rectangle at position (66, 5).
; PLAN: r0=505(x), r1=162(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=272(x1), r6=62(y1), r7=44(x2), r8=84(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=66(x), r11=5(y), r12=68(width), r13=112(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 505
LDI r1, 162
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 272
LDI r6, 62
LDI r7, 44
LDI r8, 84
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 66
LDI r11, 5
LDI r12, 68
LDI r13, 112
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
