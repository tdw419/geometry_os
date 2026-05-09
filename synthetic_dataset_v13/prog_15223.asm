; DESCRIPTION: Composite: Draws a black line from (393, 155) to (276, 79) then Places a purple dot at position (315, 220) then Places a magenta 29x10 rectangle at position (274, 91).
; PLAN: r0=393(x1), r1=155(y1), r2=276(x2), r3=79(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=315(x), r6=220(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=274(x), r11=91(y), r12=29(width), r13=10(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 393
LDI r1, 155
LDI r2, 276
LDI r3, 79
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 220
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 274
LDI r11, 91
LDI r12, 29
LDI r13, 10
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
