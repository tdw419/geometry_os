; DESCRIPTION: Composite: Renders a black line between points (322, 55) and (187, 245) then Places a green 97x71 rectangle at position (168, 181) then Draws a purple circle centered at (190, 95) with radius 37.
; PLAN: r0=322(x1), r1=55(y1), r2=187(x2), r3=245(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=168(x), r6=181(y), r7=97(width), r8=71(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=190(x), r11=95(y), r12=37(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 322
LDI r1, 55
LDI r2, 187
LDI r3, 245
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 181
LDI r7, 97
LDI r8, 71
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 190
LDI r11, 95
LDI r12, 37
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
