; DESCRIPTION: Composite: Creates a purple circular shape at (231, 179) with radius 62 then Renders a red line between points (486, 246) and (417, 114) then Draws a black rectangle at (279, 26) with width 116 and height 57.
; PLAN: r0=231(x), r1=179(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=486(x1), r6=246(y1), r7=417(x2), r8=114(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=279(x), r11=26(y), r12=116(width), r13=57(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 231
LDI r1, 179
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 486
LDI r6, 246
LDI r7, 417
LDI r8, 114
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 279
LDI r11, 26
LDI r12, 116
LDI r13, 57
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
