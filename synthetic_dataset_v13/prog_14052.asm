; DESCRIPTION: Composite: Draws a yellow line from (416, 134) to (323, 113) then Places a purple dot at position (104, 102) then Places a blue 94x106 rectangle at position (84, 13).
; PLAN: r0=416(x1), r1=134(y1), r2=323(x2), r3=113(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=104(x), r6=102(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=84(x), r11=13(y), r12=94(width), r13=106(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 416
LDI r1, 134
LDI r2, 323
LDI r3, 113
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 104
LDI r6, 102
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 84
LDI r11, 13
LDI r12, 94
LDI r13, 106
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
