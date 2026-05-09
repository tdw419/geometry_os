; DESCRIPTION: Composite: Draws a blue line from (23, 246) to (326, 221) then Draws a purple rectangle at (117, 109) with width 82 and height 86 then Renders a blue disk with center (205, 108) and radius 68.
; PLAN: r0=23(x1), r1=246(y1), r2=326(x2), r3=221(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=117(x), r6=109(y), r7=82(width), r8=86(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=205(x), r11=108(y), r12=68(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 23
LDI r1, 246
LDI r2, 326
LDI r3, 221
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 109
LDI r7, 82
LDI r8, 86
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 205
LDI r11, 108
LDI r12, 68
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
