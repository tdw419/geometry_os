; DESCRIPTION: Composite: Draws a red rectangle at (397, 67) with width 89 and height 38 then Draws a blue line from (294, 122) to (353, 107) then Renders a blue disk with center (157, 102) and radius 59.
; PLAN: r0=397(x), r1=67(y), r2=89(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=294(x1), r6=122(y1), r7=353(x2), r8=107(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=157(x), r11=102(y), r12=59(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 397
LDI r1, 67
LDI r2, 89
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 122
LDI r7, 353
LDI r8, 107
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 157
LDI r11, 102
LDI r12, 59
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
