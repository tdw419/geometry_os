; DESCRIPTION: Composite: Places a black circle of radius 66 at center (171, 168) then Draws a purple line from (90, 25) to (337, 168) then Draws a green rectangle at (374, 134) with width 68 and height 116.
; PLAN: r0=171(x), r1=168(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=90(x1), r6=25(y1), r7=337(x2), r8=168(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=374(x), r11=134(y), r12=68(width), r13=116(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 171
LDI r1, 168
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 90
LDI r6, 25
LDI r7, 337
LDI r8, 168
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 374
LDI r11, 134
LDI r12, 68
LDI r13, 116
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
