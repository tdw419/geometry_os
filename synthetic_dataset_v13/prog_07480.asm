; DESCRIPTION: Composite: Draws a red line from (391, 155) to (378, 161) then Places a black 27x37 rectangle at position (431, 213) then Renders a red disk with center (451, 162) and radius 28.
; PLAN: r0=391(x1), r1=155(y1), r2=378(x2), r3=161(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=431(x), r6=213(y), r7=27(width), r8=37(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=451(x), r11=162(y), r12=28(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 391
LDI r1, 155
LDI r2, 378
LDI r3, 161
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 431
LDI r6, 213
LDI r7, 27
LDI r8, 37
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 451
LDI r11, 162
LDI r12, 28
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
