; DESCRIPTION: Composite: Renders a blue line between points (39, 70) and (272, 73) then Places a red dot at position (11, 15) then Draws a orange rectangle at (351, 66) with width 24 and height 46.
; PLAN: r0=39(x1), r1=70(y1), r2=272(x2), r3=73(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=11(x), r6=15(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=351(x), r11=66(y), r12=24(width), r13=46(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 39
LDI r1, 70
LDI r2, 272
LDI r3, 73
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 11
LDI r6, 15
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 351
LDI r11, 66
LDI r12, 24
LDI r13, 46
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
