; DESCRIPTION: Composite: Places a yellow 114x47 rectangle at position (272, 59) then Draws a purple line from (475, 1) to (97, 85) then Places a blue dot at position (21, 251).
; PLAN: r0=272(x), r1=59(y), r2=114(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=475(x1), r6=1(y1), r7=97(x2), r8=85(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=21(x), r11=251(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 272
LDI r1, 59
LDI r2, 114
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 475
LDI r6, 1
LDI r7, 97
LDI r8, 85
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 21
LDI r11, 251
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
