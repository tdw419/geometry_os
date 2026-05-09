; DESCRIPTION: Composite: Renders a orange box of size 63x27 starting at (355, 111) then Places a blue line segment connecting (132, 133) to (155, 230) then Places a white circle of radius 78 at center (339, 132).
; PLAN: r0=355(x), r1=111(y), r2=63(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=132(x1), r6=133(y1), r7=155(x2), r8=230(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=339(x), r11=132(y), r12=78(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 355
LDI r1, 111
LDI r2, 63
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 132
LDI r6, 133
LDI r7, 155
LDI r8, 230
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 339
LDI r11, 132
LDI r12, 78
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
