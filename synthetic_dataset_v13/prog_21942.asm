; DESCRIPTION: Composite: Renders a blue box of size 13x43 starting at (231, 83) then Places a yellow circle of radius 21 at center (26, 175) then Renders a blue line between points (462, 10) and (507, 68).
; PLAN: r0=231(x), r1=83(y), r2=13(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=26(x), r6=175(y), r7=21(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=462(x1), r11=10(y1), r12=507(x2), r13=68(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 231
LDI r1, 83
LDI r2, 13
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 26
LDI r6, 175
LDI r7, 21
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 462
LDI r11, 10
LDI r12, 507
LDI r13, 68
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
