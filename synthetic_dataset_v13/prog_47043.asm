; DESCRIPTION: Composite: Places a cyan circle of radius 62 at center (161, 123) then Draws a purple rectangle at (221, 43) with width 96 and height 69 then Draws a blue line from (326, 129) to (216, 10).
; PLAN: r0=161(x), r1=123(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=221(x), r6=43(y), r7=96(width), r8=69(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=326(x1), r11=129(y1), r12=216(x2), r13=10(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 161
LDI r1, 123
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 221
LDI r6, 43
LDI r7, 96
LDI r8, 69
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 326
LDI r11, 129
LDI r12, 216
LDI r13, 10
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
