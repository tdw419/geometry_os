; DESCRIPTION: Composite: Renders a blue box of size 46x13 starting at (155, 111) then Draws a black line from (133, 244) to (207, 83) then Places a red dot at position (433, 3).
; PLAN: r0=155(x), r1=111(y), r2=46(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=133(x1), r6=244(y1), r7=207(x2), r8=83(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=433(x), r11=3(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 155
LDI r1, 111
LDI r2, 46
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 133
LDI r6, 244
LDI r7, 207
LDI r8, 83
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 433
LDI r11, 3
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
